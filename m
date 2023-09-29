Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1B8E81815
	for <phone-devel@archiver.kernel.org>; Fri, 29 Sep 2023 21:51:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbjI2VvH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 29 Sep 2023 17:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233516AbjI2VvG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 29 Sep 2023 17:51:06 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E47FE6
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 14:51:03 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-59bc956b029so176669637b3.2
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 14:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696024262; x=1696629062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hskw88hLeAFbdhf2MCWNUtrnHOIlmXUQ4ZL1O7T/y0E=;
        b=M2ygEO2xao9bi1LsQy8OB5+84c6hVswvmjJwxCoJHSHOM/pIbKXoenew8o0NL1JgGW
         kxRUK8At0IKdWg2TuKHOrVi9ymb9Eeckmr211X/KOAYMMyfc2BuOyCkWnBdDxVs/c60r
         m9FF3Q0Vz6Q8ZqFB+m5MxoSLqtg0PwzRA9arXKzXvO3KYW3enAZACmKI8MFDldD05HNl
         Qd0ZDPm4RbB2K8CtconqBtn0QE/xeC2UiSp5KDOFODfrbEXgRUs/GU1BCMqnMEguarnd
         4GZn0piAkt8redRma/jLzZza9yszARRsyaXGc/C03Phckc79/4p4X/pbUDWj+zqg6sPk
         RpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696024262; x=1696629062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hskw88hLeAFbdhf2MCWNUtrnHOIlmXUQ4ZL1O7T/y0E=;
        b=bu9pKPmGuQM0NyzFo/Ofc5boYa5hMOMXoaqm+GSHCFeH7xswFbM2tVI7SbrIOIxklx
         cVwWjsGONs/2CoGVpSAXX7mEe3dkpQTULJNyeS8EF95y9oarUtl38s7/dxU5A9mjXUqq
         BTzDvhjd9R7OIFKsMLMOp8CvNBS4pw9z0ec66q7xd4o9ngioqjmD3hzU7pg5yupU7Gyf
         bU2F6F2GkveQLYwb1DdJz+b5IYzsxF7m04IgWVL8DHYkDXKu9E1J9I3iU1BB9aC98MYU
         jEYQKxN7cw6vFSwny+fSKbXM7Sw/13TK0pZkj3R5Rr9knJnHrVGXbHzbAzGEIu1q4Vdu
         adGg==
X-Gm-Message-State: AOJu0Yx9XgvsNGfSSqFwTX4WuB/7yJBHZPbZR7C9CImybFamJSZfzwfr
        AnYWja6oUWUrnex5dCsiU74Hrrx+qhR6UWPbqyxBQg==
X-Google-Smtp-Source: AGHT+IE63fBH+1dNUwDRNH6iqlkLqEfx/+NHRsl/1r9uDgfQ0bqotCuiv4a9l+YPI2jFuA031iE6BeH9RXt0OKpKTI8=
X-Received: by 2002:a0d:dd11:0:b0:59b:e97e:f7ce with SMTP id
 g17-20020a0ddd11000000b0059be97ef7cemr5210736ywe.22.1696024262418; Fri, 29
 Sep 2023 14:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230929-pxa1908-lkml-v5-0-5aa5a1109c5f@skole.hr> <20230929-pxa1908-lkml-v5-2-5aa5a1109c5f@skole.hr>
In-Reply-To: <20230929-pxa1908-lkml-v5-2-5aa5a1109c5f@skole.hr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 29 Sep 2023 23:50:51 +0200
Message-ID: <CACRpkdbgbu=1kD=+f83NUZwXZ80-yjGOdH2CR7Lbg4rhubaR0g@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 2/8] clk: mmp: Switch to use struct u32_fract
 instead of custom one
To:     =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc:     Robert Jarzmik <robert.jarzmik@free.fr>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-hardening@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afaerber@suse.de, balejk@matfyz.cz,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, Sep 29, 2023 at 5:42=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:

> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> The struct mmp_clk_factor_tbl repeats the generic struct u32_fract.
> Kill the custom one and use the generic one instead.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
