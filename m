Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A3D0C433F5
	for <phone-devel@archiver.kernel.org>; Fri, 24 Sep 2021 23:26:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AA866103B
	for <phone-devel@archiver.kernel.org>; Fri, 24 Sep 2021 23:26:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344557AbhIXX23 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 24 Sep 2021 19:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233437AbhIXX22 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 24 Sep 2021 19:28:28 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4113C061571
        for <phone-devel@vger.kernel.org>; Fri, 24 Sep 2021 16:26:54 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id o59-20020a9d2241000000b0054745f28c69so13230568ota.13
        for <phone-devel@vger.kernel.org>; Fri, 24 Sep 2021 16:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3XQFTBr5XEn3EXyMt66fx2XwGJnL26+A55+hz8LaDd8=;
        b=DzlJwWWIjFdTnGfmcu3m+5f+Hv5b37y1M6GtT1H+OypKqT2szhIS12Oteh+ABJf9IJ
         EPJCzr+z7+h8TvlxpFdkbBDDAwnFkGM9B9KZhxXBXI2dsXVNJop+yKKpjrjMbYOwKdrq
         +SuGl9+i+jlAvgFibBJJ4wL8HBL3tPdziLEb8KgCBN+2hlHp7K1jM+/yHgxw7JaffIFA
         onJuP2Hz+c0Xmne/AaKhwGWBTv9P0RzYY/IldBQMM8m15q/tWRiBlcrrhxI6ul6w20H2
         noBLy4jDcJ1CjO8RAv3PEIsji61SOhrKIG+MumNk5FQJRs4Pg0GBdIZXHTmZHEb+zgwM
         KD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3XQFTBr5XEn3EXyMt66fx2XwGJnL26+A55+hz8LaDd8=;
        b=LBZpm02WqPiPw5+2ix45M3zf3IDwGsc2IY7RNFJAEX0cgwT4laE89ft+5jS5fUpcPZ
         WDRBIvEkOiJSS1VKPHu+o93yJ5O5VrrPT8byI+3HXuMaaoE5lsGsbe8IlRn0CSqVD8t6
         eM//fUzJgNPXoKkkyNv0IdI+2w5fUya2/UAXNsO2Vxz6+ntmBHhelTPlaiwEvuLQ2Ngl
         7mzwE31zX8muiHdcCKerQUQwiL2bv9yucGgakoVUIBFZEwNCH/VeQ94PMea2BiwFudLv
         KisnT+WC27Y2fAmHYCFciFXOxpNt9WuEoH0QsHfPlkG4GR2q08oBo+8/cTze+cx9n16r
         OWCg==
X-Gm-Message-State: AOAM530Wzp1Yb+HSDd5iKK8RBm/xngScEJg+588paOeMe/sbztHFQUVG
        DbzSvEkuMU66Cgi9kty6Plz2VA==
X-Google-Smtp-Source: ABdhPJywyIzsSfWMZIv2gVaYNQ82uQ/h9mZsmNn3XnVY2AOC6Rc5g6ecLAE3qspEjOIqNTTVCunC+g==
X-Received: by 2002:a9d:7146:: with SMTP id y6mr6566854otj.17.1632526014241;
        Fri, 24 Sep 2021 16:26:54 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t21sm1409102otr.13.2021.09.24.16.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 16:26:53 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, phone-devel@vger.kernel.org,
        marijn.suijten@somainline.org, paul.bouchara@somainline.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 1/7] arm64: dts: qcom: Introduce support for MSM8998 Sony Yoshino platform
Date:   Fri, 24 Sep 2021 18:26:52 -0500
Message-Id: <163252599406.1220936.17367661716505828954.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210909123733.367248-1-angelogioacchino.delregno@somainline.org>
References: <20210909123733.367248-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, 9 Sep 2021 14:37:27 +0200, AngeloGioacchino Del Regno wrote:
> This commit introduces support for the Sony Yoshino platform, using
> the MSM8998 SoC, including:
> - Sony Xperia XZ1 (codename Poplar),
> - Sony Xperia XZ1 Compact (codename Lilac),
> - Sony Xperia XZ Premium (codename Maple).
> 
> All of the three aforementioned smartphones are sharing a 99%
> equal board configuration, with very small differences between
> each other, which is the reason for the introduction of a common
> msm8998-sony-xperia-yoshino DT.
> 
> [...]

Applied, thanks!

[1/7] arm64: dts: qcom: Introduce support for MSM8998 Sony Yoshino platform
      commit: 390883af89d2ed653c3f7eefc06368241d422a38
[2/7] arm64: dts: qcom: msm8998-xperia: Add RMI4 touchscreen support
      commit: ebe0932e4fe5a5a0eb197f1de50442a2bf2d7b08
[3/7] arm64: dts: qcom: msm8998-xperia: Add support for wcn3990 Bluetooth
      commit: 58ba4efabc150f85ba3c80a31c37e03adebd5135
[4/7] arm64: dts: qcom: msm8998-xperia: Add support for gpio vibrator
      commit: 4de9700d0332f21d12ffec7ba67733ea9a6581a5
[5/7] arm64: dts: qcom: msm8998-xperia: Configure display boost regulators
      commit: 67372ee2c0bca8bfb1e16e961e9f3969d434f978
[6/7] arm64: dts: qcom: msm8998-xperia: Add camera regulators
      commit: a5fde059398b5d985a3fcfea06f75cce2a88081f
[7/7] arm64: dts: qcom: msm8998-xperia: Add audio clock and its pin
      commit: 6cadaa14f290a0b7c2f3b2b7afd3192c5b49473f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
