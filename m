Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08C6C433EF
	for <phone-devel@archiver.kernel.org>; Sun,  3 Jul 2022 03:59:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232670AbiGCD7s (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 2 Jul 2022 23:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232414AbiGCD6h (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 2 Jul 2022 23:58:37 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D413BF79
        for <phone-devel@vger.kernel.org>; Sat,  2 Jul 2022 20:57:43 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-101b4f9e825so8839422fac.5
        for <phone-devel@vger.kernel.org>; Sat, 02 Jul 2022 20:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ywkPZufTnD1xHLiTv5IWpd6Pq71Ja3jgwwnqALPUIeY=;
        b=XT7HWcqAnAn8cZm9UIgQQAPke8Mw/3lizgqKFx6p58hNuVvAqE+tVbtp80SqdvqoeG
         yVeIu79eDZYxqE1tAkXXPWPY5bhm4K2yBkJwXgk3NuEgAf+tHoP33UkCl9hByBwBudSK
         AcM0PxOY2doYuMO8RhMRpazTFNrCdn9eTrXxv2VFqdbftWeCTwbOMSejnMp7KrN/mvkE
         IV9YIlSoC6X5Y869QmdQ4d3FVWddRjKMtMpQ4mCrzXXepIHXHOC92zTxhatPu2Es9e3B
         H+IuHR/GLRoOQoeWE5mCYtaGr8vufPuCkEgIhwlYcIcRGDeG+ahy+XPj7m87eLjl32JF
         ShmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ywkPZufTnD1xHLiTv5IWpd6Pq71Ja3jgwwnqALPUIeY=;
        b=BaIUHYO70TUye16DdyPUu1ozKK3c2rHoz+iKFgtR/W55i06iLngsr8UxEwIoGM4NL/
         x1yr89RGwY78MchC3ArKRycZqzP1Nn7NtfgDF6pkRSgrYvZ7MbuuzfTA+2MC+oDLQFra
         eoS7z4p1wgQL1HDoE/0Q5IuCVTHM7NwoerMAmXpsMRjTyqFsdemLEosDtr1yaT7B2qv9
         4T8DcrVsGcXoBVrYzEhOILVSDbAlaAo8XMSRINJiP7GngKPnfZhi7Dsc6od4vKKMUwtk
         vegP/3C8ni+loauSBQ6j38CgBFMvHS6rmA+/mkye+FPL7iRTXBzSbHt1dc7mIP2F9s1B
         +1tg==
X-Gm-Message-State: AJIora9Y9krZtvS7w/PLGdvGkZf5pjTCSmfEJ6sclLqxKHB1H63dkBLJ
        7rR1So6toS8cwQIOtPbzYctsZw==
X-Google-Smtp-Source: AGRyM1vWHafWg3xMomiCjHCB4819Hr7lbc+AFHzVCFuyBw55VOA+C+R+jhRui83frtUIXuGbCXUiYg==
X-Received: by 2002:a05:6871:4707:b0:108:a985:65f0 with SMTP id py7-20020a056871470700b00108a98565f0mr13668107oab.262.1656820662938;
        Sat, 02 Jul 2022 20:57:42 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:42 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/2] ARM: dts: qcom: msm8974: re-add missing pinctrl
Date:   Sat,  2 Jul 2022 22:56:36 -0500
Message-Id: <165682055971.445910.5175604693918801698.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220606160421.1641778-1-luca@z3ntu.xyz>
References: <20220606160421.1641778-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, 6 Jun 2022 18:04:21 +0200, Luca Weiss wrote:
> As part of a recent cleanup commit, the pinctrl for a few uart and i2c
> nodes was removed. Adjust the names and/or add it back and assign it to
> the uart and i2c nodes.
> 
> 

Applied, thanks!

[1/2] ARM: dts: qcom: msm8974: re-add missing pinctrl
      commit: 03110b46c99bb0c712f46bec660b1c3f674ce100
[2/2] ARM: dts: qcom: msm8974-*: re-add remoteproc supplies
      (no commit info)

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
