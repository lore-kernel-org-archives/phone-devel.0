Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E2FC2D0E4
	for <phone-devel@archiver.kernel.org>; Mon, 23 Nov 2020 21:23:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A64520721
	for <phone-devel@archiver.kernel.org>; Mon, 23 Nov 2020 21:23:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JFAU1aYQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729939AbgKWVXX (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 23 Nov 2020 16:23:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727725AbgKWVXX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 23 Nov 2020 16:23:23 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027A1C061A4E
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2020 13:23:22 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id u19so25855277lfr.7
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2020 13:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vRZ/gKrfEgXXPL3DmEFvGxpTfGP1G2iZrpLKbx41KPU=;
        b=JFAU1aYQDQw7PAw6MuOA4Haf/FSt2b20JWn46yctmfUW7d3b0XtyKdBfRLw4Ki7Uah
         4DXsscwINcAaysL1AyrDQR2AYEeQiIaM7tZDDjWu0j7r8FhEs8gGFPiEQkmYnoXeTQ+F
         ZHGSr6cXBktjGmWjyH9CK2qccW/2izQwCs4tWqmN/3DJ1pCY3if+bqrKy30fxU+cSt8U
         ax0q2Kolx75J9yV89jDKNM7UCdN8LCLKD/avamFApLoGOtMMBYEoUWVR1QKLW479qRns
         YeCycSvj44T9T51EGhTMJfsfYPAAg34QKhnzqxqplYcJpavb93QDa/lhiGg4LOlGds13
         aV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vRZ/gKrfEgXXPL3DmEFvGxpTfGP1G2iZrpLKbx41KPU=;
        b=PtOqtFVJasW/g+3p8bLUnAIjLYTQPtqPnSvQRyy+AhaqNeJmJUv42SGx3BBeLcA+QC
         z8YuU2Yy0kaUbWR6WCso98TFPxlLyPVUkPStAJuBE3IGbwXn+bul7Gyf4srvikqX1fi8
         S5EIsCXnxh+JC9f7wTgIhB8x6YNm7DEidO1X+FWC9fL5NMlIRhj9Pzisa/iNTodMSP61
         R3+grIgTct8H4jgpUoYt0keIOpeulyH35ZOrZ6rUSmokvtdWaeSiOHUBk6/0JX2bmDRC
         3X8MRgHN69Z9mStfO69k10ozFyTpb/rRkQMUFDASA/Ov6Awpml/V3l9OT8BArdIJU6xb
         HiFw==
X-Gm-Message-State: AOAM531pyANQ16WdA7O6tk0DKtNgYIyqhciKieHliWBMHENr+jAPRLvm
        6ivhtc5pdiwimWBn2KTNY5Toal2pt7t43FdBLRbrCqZES14V5Kul
X-Google-Smtp-Source: ABdhPJy2Q0A7D8Lk4T9WUvsZAqStaMJ1heV2jCWT5l7VWJMu9ZmC9IWtTK3/IWTF52cjUy4teKASDDQm/uH/X/faXvI=
X-Received: by 2002:a19:7b06:: with SMTP id w6mr477889lfc.260.1606166601367;
 Mon, 23 Nov 2020 13:23:21 -0800 (PST)
MIME-Version: 1.0
References: <20201113124239.2667502-1-linus.walleij@linaro.org>
 <20201121132742.GA2121607@robh.at.kernel.org> <CACRpkda6EDjtDEK6N0kvnpyBD+6ofgdBcUeqn70VG4FY_0X1-g@mail.gmail.com>
In-Reply-To: <CACRpkda6EDjtDEK6N0kvnpyBD+6ofgdBcUeqn70VG4FY_0X1-g@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 23 Nov 2020 22:23:09 +0100
Message-ID: <CACRpkdZvEstDXx9-m7n09H1FmbwnT014Lyv2nDdc_nXM0KUbpA@mail.gmail.com>
Subject: Re: [PATCH 1/2 v5] dt-bindings: leds: Add DT binding for Richtek RT8515
To:     Rob Herring <robh@kernel.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        phone-devel@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sat, Nov 21, 2020 at 4:25 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> > Units? Add a defined unit suffix to the property name and you can drop
> > the type.
>
> Do you mean that if I rename this property as:
>
> richtek,rfs-ohms
>
> there will be some automagic machinery in dtschema that checks that
> it is an uint32?
>
> Is there a list of these magic suffixes somewhere?

Got impatient and grepped around myself :D
So schemas/property-units.yaml and meta-schemas/vendor-props.yaml
explains a lot!

Clever, we should add these example tweaks to the example schema
as illustration of available intrinsics.

Okidoki, respinning tagging on -ohms!

Yours,
Linus Walleij
