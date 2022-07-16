Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046A6CCA480
	for <phone-devel@archiver.kernel.org>; Sat, 16 Jul 2022 15:19:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232109AbiGPPTY (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 16 Jul 2022 11:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231903AbiGPPTV (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 16 Jul 2022 11:19:21 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BEC11EEDD
        for <phone-devel@vger.kernel.org>; Sat, 16 Jul 2022 08:19:19 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-fe023ab520so12804041fac.10
        for <phone-devel@vger.kernel.org>; Sat, 16 Jul 2022 08:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pZOSkcNfh6QEts/D5ER9Wn7qtlpWbY9jlfuonnCfELE=;
        b=ucizGStdvD0K5tqcAJ9Uk4BwAJwJB8VEZ+WQd6NqWhz3gBUDVLBCsiSEaYwBHlolfM
         6I4acZFaJ6czdDa3zs3jME5gzq8v/yWt0Ppw/eiVC0Fc1PhXmPhGazkSDWVZ0LmeN1IP
         XRvK3bsdAwChBvgm1yik5w6vYT7cegBOKzjzQGAe6tOjpipRxyAZzoH3ElpYvglq6sQz
         BNV1crz9sIlRfs1TW/0NzlYUv2pz6eckgMSsVQ2IRg+df0ter5s5vs52HzPLjcJ4eIoD
         Aaiebi5xCRuufO5mvXhHwsrqQi+LPKMp+VWPmAQvUrW9Aomv4WOrztiUp1XQt7Gc8uyJ
         ZW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pZOSkcNfh6QEts/D5ER9Wn7qtlpWbY9jlfuonnCfELE=;
        b=V+dUBnLvs1Oa97dXV+ewxoyuQ9z45zVzRBpNE1e7noXmDW70MrbhWzXHylq1PscmNP
         a42k/NR18e+ASPWfHYo5MAMuzZal8sJV5zx/cpuJk7yqr8TnNi2A/vhH0SNDI+MeXw3J
         4D0XNDL02TWaFnHuJSEBhoLDaY7e1DMG48TS1ivHSBxioaKnU4I1eEWDbo0wjwOVE3d6
         D+1HhY9am658KUfL1vGomWJYTLWEC/uCoEggAcrLG5YsJ7/lIjDQgBRQPMOZU391yDx0
         RMn6KUWLpXSGV66Z2LLkiMKVlmd9dL/nunPAThvdPLZDZgUAmWyozqBkY35b7LX9AR69
         DwEg==
X-Gm-Message-State: AJIora+3HXFtWdRSltUeh45ECRhnrlSFDYm1bff6DD4tIepD/P3TdIqy
        4pkde4D7rxEY8mFNzsNSUZC9JdiFtvQvFQ==
X-Google-Smtp-Source: AGRyM1v4YlZR+OBx9xoktPZFAA7detM3a3H2PiB+7KpeRGKYRYWTFaWsIfFvv35OTB42iHJwK7f8VQ==
X-Received: by 2002:a05:6870:b4a7:b0:10b:fb83:650c with SMTP id y39-20020a056870b4a700b0010bfb83650cmr10351055oap.27.1657984758609;
        Sat, 16 Jul 2022 08:19:18 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m21-20020a4ad515000000b00425beedad70sm3035254oos.32.2022.07.16.08.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 08:19:18 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     phone-devel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH] arm64: dts: qcom: sm6350: Replace literal rpmpd indices with constants
Date:   Sat, 16 Jul 2022 10:19:01 -0500
Message-Id: <165798474063.1679948.11675191794753328799.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507224645.2238421-1-marijn.suijten@somainline.org>
References: <20220507224645.2238421-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun, 8 May 2022 00:46:45 +0200, Marijn Suijten wrote:
> It seems the SM6350_CX definition was temporarily replaced with its
> literal value 0 in 1797e1c9a95c ("arm64: dts: qcom: sm6350: Add SDHCI1/2
> nodes") to prevent a dependency on the qcom-rpmpd.h header patch being
> available prior to this DT patch being applied, similar to c23f1b77358c
> ("arm64: dts: qcom: sm6125: Avoid using missing SM6125_VDDCX").
> However, unlike the revert of that in the sm6125 tree the next merge
> window around in a90b8adfa2dd ("Revert "arm64: dts: qcom: sm6125: Avoid
> using missing SM6125_VDDCX""), this has not yet happened for sm6350:
> replace them back now that the definitions are definitely available.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm6350: Replace literal rpmpd indices with constants
      commit: 7a9016dbc8760c4f8a610e5cb0ae0f815b0cca81

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
