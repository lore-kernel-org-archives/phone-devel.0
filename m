Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB69E743F9
	for <phone-devel@archiver.kernel.org>; Fri, 29 Sep 2023 08:38:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232854AbjI2Iih (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 29 Sep 2023 04:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232807AbjI2Iig (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 29 Sep 2023 04:38:36 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19CC41AB
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 01:38:33 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99c136ee106so1820904166b.1
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 01:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695976711; x=1696581511; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=91bzG0Gvztxq9AzwDAH8hNYEi4ko/cSP4Liv9cAEuIU=;
        b=DdRblbFAPurXIUU3F+cpsJB31BK2VR2TiUJd5qijD2gkO6V2FAjVHMq6flca39GuDo
         Voo3bojKdLA12UeP6IUTduNOylBAw2iMp8pvm/tLkRjQh5yUhcAUYsbV1Nl5y/Iyqmm+
         3JY9IfjQWtMfaSQcJCGaPnUhdqiYYkNpkVIvXvPz8V/kP8+dgmmxWXMTp3Ywba9U56a7
         hR4lJBnX+SsfiJZYmRaU2Hv3iZCfQEZgYnXW7B8nxYUHL3yMKu0tfOcqDJ/P5AIs9kCB
         lVOvqStfxIJdwaWpft4ljxadtUSc1du876WdyQVh7Mbl5LrF7Oz/5KRVT/cGyq1QV4oV
         Aqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695976711; x=1696581511;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=91bzG0Gvztxq9AzwDAH8hNYEi4ko/cSP4Liv9cAEuIU=;
        b=PDFwXzUoI8f7rZRgAwKzRoT1FgCilJ0b2M7cOFGAgyao/Vda/7ZLdECyVrS7v9znrX
         JWdZIywJ2WmYdJYbcTeC+yOxUhqr9ByYrGvv7TmhCi7ScS7VuUWZgWbzc+VdLkxNLKzy
         RyTnyI3xDzZtpv1mvscK1BZZri1y8bZVMbG5N276axidmFeygO66ZaFgv/tNqSWUq6tf
         4kBCzEb9qL63Kw2PhPvJYiSbCkVkZb9k4hc2xzv2ebyEbohRE15jpQecb3Q0OgYA6VXG
         Cqt32K6Bbfo7zA+A46ZsdneGJYF0ZszphkzGiLv8Y4bYphco03gjPyWa8xB6ium2OMQy
         jcGg==
X-Gm-Message-State: AOJu0Yw89RWmkWX6gTzkw0nCOyirqNJuHHctmnNGfwRKUWqsvX7pkYCx
        RZx96Hrmrp8Sl5vn2diCeYjNCQ==
X-Google-Smtp-Source: AGHT+IHLsYBhakgorb9cz9xMHTZREOY3MKxX8RWfDk0MxVttJTRKtifVvOUBTcfVorek5kiIlkefrQ==
X-Received: by 2002:a17:906:3402:b0:9a1:bb8f:17d0 with SMTP id c2-20020a170906340200b009a1bb8f17d0mr3167830ejb.30.1695976711532;
        Fri, 29 Sep 2023 01:38:31 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id qk8-20020a170906d9c800b009ad89697c86sm12208965ejb.144.2023.09.29.01.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 01:38:31 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Enable venus on Fairphone 5 / non-ChromeOS sc7280
 venus support
Date:   Fri, 29 Sep 2023 10:38:18 +0200
Message-Id: <20230929-sc7280-venus-pas-v1-0-9c6738cf157a@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPqMFmUC/x3MMQqAMAxA0atIZgM1pWq9ijgUjZqlSoMiSO9uc
 XzD/y8oJ2GFoXoh8S0qRyxo6grmPcSNUZZiIEPWePKoc0e9wZvjpXgGRQ6+tcaR65yFkp2JV3n
 +5Tjl/AHEswkEYgAAAA==
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Devices with Qualcomm firmware (compared to ChromeOS firmware) need some
changes in the venus driver and dts layout so that venus can initialize.

Do these changes, similar to sc7180.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      media: venus: core: Set up secure memory ranges for SC7280
      arm64: dts: qcom: sc7280: Move video-firmware to chrome-common
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable venus node

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++++
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 8 ++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 6 ++----
 drivers/media/platform/qcom/venus/core.c           | 4 ++++
 4 files changed, 19 insertions(+), 4 deletions(-)
---
base-commit: df964ce9ef9fea10cf131bf6bad8658fde7956f6
change-id: 20230929-sc7280-venus-pas-ea9630525753

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

