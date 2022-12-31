<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavBar.ascx.cs" Inherits="R52_M6_Class_02_Work_01.Partials.NavBar" %>
<nav class="navbar bg-white navbar-expand-md fixed-top shadow-sm">
    <div class="container">
        <span class="navbar-brand">Web Forms <sup>2</sup></span>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse" id="nav">
            <ul class="navbar-nav  ms-auto">
                <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Examples
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="../Ex_01.aspx">Ex 01</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
