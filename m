Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2138DCCA483
	for <phone-devel@archiver.kernel.org>; Sun,  3 Jul 2022 03:59:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232642AbiGCD7p (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 2 Jul 2022 23:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232628AbiGCD7J (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 2 Jul 2022 23:59:09 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB267BF71
        for <phone-devel@vger.kernel.org>; Sat,  2 Jul 2022 20:57:48 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id w193so8946220oie.5
        for <phone-devel@vger.kernel.org>; Sat, 02 Jul 2022 20:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W92t9vb8RyuMAsngPIQE5DDwov75LnCzM9uTCriJUuE=;
        b=dtBiwIUOP73p3Ub+FJgRTZULzSMWy19sIwUMCtfYLY3c9h6VZGqcvJnJ/lgru4/nJo
         RTE2NkiqRdWnALkUIJHia2vIoF1GwyW9pvoHw52KKNblp1q9YnVZO873NN/bmUJXvXfS
         X8ObHCBnHB0ebShNkloMz0cZ0ctDG86xJFS0jhZVIfqCGLYFuo4ReRKUAZbhY5M1z0Pq
         wSYGADDJ1NGDg/gQ4PQjGlRyhj7IBqLs26WsEU+6QgyvDc4fmijJZlvmce+d19NvJEPE
         NHI98XNiSl+S7FvCWog9h9RjvbmoIKmdEp9wCwRYpDeBn/VPB9u+z74UdkVkhGrTB1jA
         tIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W92t9vb8RyuMAsngPIQE5DDwov75LnCzM9uTCriJUuE=;
        b=xIAOh5oxYgdOvdaWUT3oeONu5BrZzLwQFjvfDqBKqUbXDtxKRE4z0iKPxBZQ+HjAFH
         NoYX53Wy4JWmhrCEHKOtEuLCpXpz8K9sCONY3cfhTE0zvZWg67bTYSFfn3wp4/4dU940
         qFoE7sYOd8M/mqxaf122ahBcoC8/P5lU5lqSuqXrxsIR/0L9vSvrMF/GL8mUBe0WiNL+
         WxWQbZGAWAECNiZwyKFKc74hib2dwoAyOY+5G/WXEpXLT8l8cct8wvnh9LtreZT/c7C8
         dzBSBBeq8nhyOkReRP9y0eiuxzVA1rOcNPYZJiYn05DpRzRSwcAo3korEkpAMvtu1+CZ
         yQuQ==
X-Gm-Message-State: AJIora9oy7Z69hU/KErbT7KBMZ8NmuBHCKkcpnE299nOtX/62IidaWUi
        tfJ9/Z6Ly7qrMZTrgni6hVql3MUsiiEuHA==
X-Google-Smtp-Source: AGRyM1uNAYPGQITKnJ9PX66/GdKmHQYcgLdvZwQy3L6b7FyJwRJV8X8tCMWB0wH2/SYsnFlxxGkKFg==
X-Received: by 2002:a05:6808:148b:b0:335:8f41:3ab0 with SMTP id e11-20020a056808148b00b003358f413ab0mr13683198oiw.172.1656820667876;
        Sat, 02 Jul 2022 20:57:47 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:47 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     phone-devel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        devicetree@vger.kernel.org,
        Martin Botka <martin.botka@somainline.org>,
        linux-leds@vger.kernel.org, Rob Herring <robh@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH v3 1/4] dt-bindings: leds: qcom-lpg: Add compatible for PM660L LPG block
Date:   Sat,  2 Jul 2022 22:56:41 -0500
Message-Id: <165682055969.445910.11818943864906447784.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220511190718.764445-1-marijn.suijten@somainline.org>
References: <20220511190718.764445-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, 11 May 2022 21:07:15 +0200, Marijn Suijten wrote:
> Document the availability of an LPG configuration for the PM660L PMIC in
> the Qualcomm Light Pulse Generator driver.
> 
> 

Applied, thanks!

[3/4] arm64: dts: qcom: pm660l: Add LPG node
      commit: fc41893fe8289967d0aaffab25d8bb96334cc676
[4/4] arm64: dts: qcom: sdm630-nile: Add RGB status LED on the PM660L LPG
      commit: dd764e1a42367c93d1e8e3f9e1ce08752a6dbac2

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
