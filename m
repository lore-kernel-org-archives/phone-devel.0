Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D82C433E9
	for <phone-devel@archiver.kernel.org>; Sat,  9 Jan 2021 22:13:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6BF623B08
	for <phone-devel@archiver.kernel.org>; Sat,  9 Jan 2021 22:13:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbhAIWNW (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 9 Jan 2021 17:13:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbhAIWNW (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 9 Jan 2021 17:13:22 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94CF4C0617A2
        for <phone-devel@vger.kernel.org>; Sat,  9 Jan 2021 14:12:41 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id m12so31769257lfo.7
        for <phone-devel@vger.kernel.org>; Sat, 09 Jan 2021 14:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pWNdgAB7F54905PSxndcuizQFvWz899oT1UF8mQCigE=;
        b=VoWkuuaRzIcof6rg6fCj8gUuVQmk4mX+M7w5MsOegPHy0wlbZN0g5y31EVEOCG+JFc
         nZe3HayAOiuIRSWyGrg3Kw+lXX5mzU42uxaKbudkmwFyjtUHFjFsAk3586c4vTmyCImp
         AArWIZlmcpjQVnfPPRFpfGGDDoh5ITf8qYBeLNtsIamK0ewbrxav5lk/vDozVEbyrT2q
         iQ3QcUfMyEmh5m4HCZzaEhesRxcdlPDbuHZlNQwNxNIJ2dQmaPdt4YzwwF/YqMC9vP7+
         vXN8AE3jK+j2PoFDezpL6samXXmDbIJLhf4vK2s/Z3jvdmUoiZPiZEhpnxMqDUvtpBO3
         YpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pWNdgAB7F54905PSxndcuizQFvWz899oT1UF8mQCigE=;
        b=T/DzYbCifhCCO2P7/2Citknhjt7TSxmkmowZ+weU2+pHLsxtRiQuYcNDc12+SEnP5x
         qhzFQFQTPFoz/s+R0i5Q9sHIQHwtKETLev/oner5t7hQb20FnuEuWvsx/YC6jS/pK+2h
         pDKHGsgKyJQE9hZIDQ2fWUm/OQkJVuJSh3njlhA3bA2FLQZvdsAkkh7E/rvHwRuG0ltT
         SSB8zuhm6Jub+Drxsdg3plI3lOlEHry6+SnCTv0Hfbc1Lb6bCqEC1W3WMPUyyDj1eiVu
         TyOlZC0K8r65mzTLtKYJTcm5kKA7nAKQqNDol6iGJKZtBk1rf7rM6gHiiGVfN8rxP/Se
         Vckg==
X-Gm-Message-State: AOAM530btHmAJrHf/n/oHlBM5QeDi5MRro2Bh9ebNuwymarUQrbPOYzo
        cyS6Zt7iyVVJ0I9eVppfA3MWmnZ4nPBNXjExYYlO0A==
X-Google-Smtp-Source: ABdhPJxACc9VPGH/iTwCxT+Lt9jPUgWD6ypR+Dmax5NfonZfuWTmjtMwb90HF88pUYCiu4Mx2CiDj4k+fDhIva0v5qw=
X-Received: by 2002:a2e:85d1:: with SMTP id h17mr4095505ljj.438.1610230360062;
 Sat, 09 Jan 2021 14:12:40 -0800 (PST)
MIME-Version: 1.0
References: <20210109140204.151340-2-angelogioacchino.delregno@somainline.org> <202101100151.3ojnIrPg-lkp@intel.com>
In-Reply-To: <202101100151.3ojnIrPg-lkp@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 9 Jan 2021 23:12:29 +0100
Message-ID: <CACRpkdbT6tv5ArKRLPh3hE-3fuYHotqG5tNwkF4vftSQ1T=wNA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
To:     kernel test robot <lkp@intel.com>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kbuild-all@lists.01.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sat, Jan 9, 2021 at 6:24 PM kernel test robot <lkp@intel.com> wrote:

>  > 880          gpioirq->parent_domain = NULL;

The autobuilder is complaining because your irq chip is not
hierarchical and this is only used for hierarchical irqchips.
I think you can just delete this line.

Yours,
Linus Walleij
