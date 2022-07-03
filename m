Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE11CCA480
	for <phone-devel@archiver.kernel.org>; Sun,  3 Jul 2022 03:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232637AbiGCD7o (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 2 Jul 2022 23:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232458AbiGCD7T (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 2 Jul 2022 23:59:19 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E9A2D119
        for <phone-devel@vger.kernel.org>; Sat,  2 Jul 2022 20:57:49 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id r82so8971641oig.2
        for <phone-devel@vger.kernel.org>; Sat, 02 Jul 2022 20:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UW9H/IvY4Tfy1rI+Le9eCT3S6ebQsX4xHDT5O7cGn+s=;
        b=Cns5stWkIRjHv4iUvWpMAL7XO4hCJgbx/+tkCya5nQgCdPM9RU30V4ZUWNJiM1e5n2
         zIePot0t50Z3OnbRlAc+CzDlEKwWfsuwkMKtmdBXdGTTAkwOhK7XPltyL3p1fIN3fVfV
         jQ7eXu2UCmiIhMa93BQhlnEYmsS5a6YUU3CHFwov1oyLpa0WWMAwAIapxF+PAfBiuvGE
         cXAgl5DaISV0vRa4LTEkfie55ltAokIRYVgPx33J47on/Ke/5RLOwwHqFxn7DAQayDRS
         4y+ysZtKmFUZYR0mKrGz4g9SL5rGohUSGGH4HDzelVAn57YMI3WwwB4vC3dE1KfOiF44
         nLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UW9H/IvY4Tfy1rI+Le9eCT3S6ebQsX4xHDT5O7cGn+s=;
        b=7k/xQWROZdRtqWZ/aneuzUTmGsn2BtR0DtP501BQsTAe4KA4ALKAXJU7fZMtjaA9iL
         c3tyf/b2e01SLhtmzgg07PhDV6vZVeD21HgQjYQTCzvTLcnBWgXOhFS3CvoLM3Iuenfd
         FCYyuQotPF9lVaAfP0YJud81A/vcy9rHdyfJxDnRt0SlFw8lhkL29wGtv5HxtgNQfgvn
         FQWRJVt8PoMsb/lKMJJ2ktlPQiwCjWAS4v0T+A1SSXWcp1ms++ieOF2Zw+1JgJfXyvR7
         xOtAEc8YsC6QxSc4AN3WG/E3nXprUkGd2O9F1PywjVbrF+w1/RTQppX7sNqougDn7mUi
         VowA==
X-Gm-Message-State: AJIora+358mDZTWnwmAP97w6a03AaI5hHNgZcpy0oP5or8MTypPUGfN+
        je7BYKl6nNO1CvHhS+N1EAUqoA==
X-Google-Smtp-Source: AGRyM1szLI9Z+uzAlXXOZciKArG1ZkzMdcd+g23VdWmuU5B88JfUFhf8WzQj3+a3VAT0XSwIaMLUew==
X-Received: by 2002:a05:6808:ec1:b0:331:4236:242c with SMTP id q1-20020a0568080ec100b003314236242cmr13118751oiv.19.1656820669023;
        Sat, 02 Jul 2022 20:57:49 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:48 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     jic23@kernel.org, Markuss Broks <markuss.broks@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        Song Qiang <songqiang1304521@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: (subset) [PATCH 5/5] arm64: dts: qcom: msm8998-xperia: Introduce ToF sensor support
Date:   Sat,  2 Jul 2022 22:56:42 -0500
Message-Id: <165682055970.445910.14067306079417059370.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220523175344.5845-6-markuss.broks@gmail.com>
References: <20220523175344.5845-1-markuss.broks@gmail.com> <20220523175344.5845-6-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, 23 May 2022 20:53:44 +0300, Markuss Broks wrote:
> This patch adds device tree support for the VL53L0X ToF sensor
> found on all Yoshino devices.
> 
> 

Applied, thanks!

[5/5] arm64: dts: qcom: msm8998-xperia: Introduce ToF sensor support
      commit: 642f13c32087c29ed907866c7e6765d472e8f457

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
