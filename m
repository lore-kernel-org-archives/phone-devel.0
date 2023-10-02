Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC29BE784B7
	for <phone-devel@archiver.kernel.org>; Mon,  2 Oct 2023 14:20:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237694AbjJBOUg (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 2 Oct 2023 10:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237695AbjJBOUf (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 2 Oct 2023 10:20:35 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA343E0
        for <phone-devel@vger.kernel.org>; Mon,  2 Oct 2023 07:20:31 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-533cbbd0153so19191262a12.0
        for <phone-devel@vger.kernel.org>; Mon, 02 Oct 2023 07:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1696256430; x=1696861230; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qRr3QqlzCQWTLZLmH3nUHt+TIB+s/7OFIih+wrwlQUw=;
        b=q3I/m6Sz1V6JSfTHO3I0kmyOZF6Dv6PgvGJTOq7zCq+sjl0TyOy0IgtOZPFvt30fxH
         W2sedPwviWXMz96fqgPuxZT1Or/8VN9Xrbb0cL0UdM9xlglsYgTsIe19/z+aLg8ZHeHE
         nxHc4J9T9MGQNdaq1EIINa7MqSOqjsCgyuQAfXTTLQJ3Uuq9RprN20K1EhSCPv/eoRuo
         8DoGvIBAF0cn4btnP2ik1U+s68an5yWtX3lvBf02HivgpxQZ5cla0GLfULDxwdj0o703
         2aAYKe6aH2BrGFuKvoqYn8BOK4j+7Ulueb2Go6lOKKtJE33jnzUIEv8EdLVT+7xAu89z
         tJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696256430; x=1696861230;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRr3QqlzCQWTLZLmH3nUHt+TIB+s/7OFIih+wrwlQUw=;
        b=lpaCkm35cNfcOujPlNZpe+/s8lDO9HkSdCb4gJFiieJq+yzZfFR5CfodRWwyNchj8F
         hIUWoR6ilLb7fiHwQH3UsyS1UffWvj5yKZAcUrHaArY5RINVf229lnAaBPmrFPxUPo6S
         HmHRM5BdK3QyNeiqYpATwpCfsLVfYMo8DO98R6QRsL0h2H8JSLdFEWCcMB/NJAe9CqJ1
         L+oeLf2PA/To8DH7QK5oVfIPjyLzJXOpcuYzxrSMhUcthXEEknEd/KhBrCewyAiTFRu5
         3Y7XagsJOoAujYnGB2nQyY9oktT/jxRJOBzNUj+XC1n5i1Dm3Mhye8Mi9NobCbRGiPsb
         Ho0w==
X-Gm-Message-State: AOJu0YzSBsb8P4AA7Qmew94ONyZRpi7klDpDRLeTu5RxGamPV6oLm/Vu
        2WkGityEuORn5dNZmTIEf9Lubg==
X-Google-Smtp-Source: AGHT+IG+5pBPGpfhRiQjipm0PUKoj/S0erQoDK+x+Adetl3oP5iuERhHtv3d5+mNQUvxQIkjUjcv/A==
X-Received: by 2002:aa7:d80a:0:b0:530:a5d6:583d with SMTP id v10-20020aa7d80a000000b00530a5d6583dmr10118640edq.11.1696256430236;
        Mon, 02 Oct 2023 07:20:30 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id w10-20020aa7dcca000000b005309eb7544fsm15583356edu.45.2023.10.02.07.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 07:20:29 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/3] Enable venus on Fairphone 5 / non-ChromeOS sc7280
 venus support
Date:   Mon, 02 Oct 2023 16:20:28 +0200
Message-Id: <20231002-sc7280-venus-pas-v2-0-bd2408891317@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKzRGmUC/32NQQ7CIBBFr9LM2jEUQimuvIfpguDUzkJoGCWap
 ncXPYDL95L//gZChUng1G1QqLJwTg30oYO4hHQj5Gtj0Eob5bVHiU6PCiulp+AaBCn4wSirrbM
 G2mwtNPPrl7xMjReWRy7v30Ptv/ZPrPao0MfBmTHOvXXhPAcu65ITHWO+w7Tv+weNjcDwtAAAA
 A==
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
Changes in v2:
- Reword commit message 2/3 to be clearer (Konrad)
- Link to v1: https://lore.kernel.org/r/20230929-sc7280-venus-pas-v1-0-9c6738cf157a@fairphone.com

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

