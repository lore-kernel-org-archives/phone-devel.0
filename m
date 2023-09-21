Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABD4E7D0A9
	for <phone-devel@archiver.kernel.org>; Thu, 21 Sep 2023 19:12:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjIUTMk (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 21 Sep 2023 15:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbjIUTE4 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 21 Sep 2023 15:04:56 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC0F53EEC
        for <phone-devel@vger.kernel.org>; Thu, 21 Sep 2023 11:45:29 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9a9d82d73f9so157874066b.3
        for <phone-devel@vger.kernel.org>; Thu, 21 Sep 2023 11:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695321928; x=1695926728; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wT6/A5jKUKPNqREpSjfwwNBvJsp9RJseHUsd7KRCJ5w=;
        b=05NZ35LVScgpGKp0/k0L1rkjii2pPlwvEBCpx2ralUl1tNsuuIahvFNT4uwySmF8eg
         v1Z7FAPGLFFA3F/VFEBa+EA2rPQp587ubgle+G0a7F/LWb3XXDvKxl5ZSCqk5gTQuTfC
         COXeC3FTpjVq2NHn7HLpz8giRfHKg650/xOBS1JXUMepnPmC4LKhrzJR0yVnVDxO+zAl
         FEBrZQQUHKpZRtQLag8Yt8JrquYF4VLFUs3Qkmfo7RaoF1NlC8CmkTeJFrKgqat1eyBA
         qf2hjiIMi47Kkbi9Cgk/DF1M0ABSJsBTzzyCk5WILq7vXPDA/wz+f2BARJrDaFokABCr
         Hfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695321928; x=1695926728;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wT6/A5jKUKPNqREpSjfwwNBvJsp9RJseHUsd7KRCJ5w=;
        b=UYwZuAnHKgbkjPKBL2XzTgERGB6G8pANpg6eX9jZS6osRgntIbIm0nrPe0PB1mER4z
         9dTM847jkxCVAtUCbZAK3n13hquC1gV4r+/CrMO1DvZFEU4Yku1634mf4LByCUbf2JKH
         vgz1m4/gCfy254vTLSJNItF33nxx3u9msFx+1irEJpAC6MlZh1wBA1QsTQmzVOkI9QyT
         TPOFL2zz40dAaQY3r8vl7/wRMJZjXu5DNZ1cUGd0OMQ1ofozJNi1tzrpPLfloHWYPALb
         fPbsxiqXGLvEjGXQ3BZ0HOTY4D0ruNaj9J3AZ/o0r3WgaUVf2H9Q9Me1PLheNkuqrHKV
         o34Q==
X-Gm-Message-State: AOJu0Yx7cfgAEzkxkFU6N17Ah5kAggZElP2qV8ZObLonYQpG0UWHuCik
        MfJjUjnEiHhOlkjWYyYwXOzwwoTBFLaZ1ssFdMm97g==
X-Google-Smtp-Source: AGHT+IGieRqnzeLuaUx6Ie7RXs8JxfkdBUmowjxYl2mDxddATi1AGsiIJ7LQSmc6+cCJVTz0fUr3Aw==
X-Received: by 2002:a2e:8696:0:b0:2ba:18e5:1064 with SMTP id l22-20020a2e8696000000b002ba18e51064mr3815918lji.14.1695278048481;
        Wed, 20 Sep 2023 23:34:08 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id z25-20020aa7c659000000b00530ba0fd672sm367971edr.75.2023.09.20.23.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 23:34:08 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Thu, 21 Sep 2023 08:34:02 +0200
Subject: [PATCH] ARM: dts: qcom: sdx65-mtp: Specify PM7250B SID to use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230921-pm7250b-sid-fixup-v1-1-231c1a65471f@fairphone.com>
X-B4-Tracking: v=1; b=H4sIANnjC2UC/x2MQQqAIBAAvxJ7bkFXJOwr0aFsqz1kohRB+Pek4
 zDMvJA5CWfomxcS35LlDBV024Dfp7AxylIZSJFRjjTGoyOrZsyy4CrPFVF5Y73x1hlNULuYuIr
 /OYylfA4JhdVjAAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Now that the pm7250b.dtsi can be configured to be on a different SID, we
also need to specify it for this dts file. Set it to the SID 2/3 like it
was before commit 8e2d56f64572 ("arm64: dts: qcom: pm7250b: make SID
configurable").

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts b/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
index fcf1c51c5e7a..9649c859a2c3 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
@@ -4,6 +4,10 @@
  */
 /dts-v1/;
 
+/* PM7250B is configured to use SID2/3 */
+#define PM7250B_SID 2
+#define PM7250B_SID1 3
+
 #include "qcom-sdx65.dtsi"
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <arm64/qcom/pmk8350.dtsi>

---
base-commit: 7fc7222d9680366edeecc219c21ca96310bdbc10
change-id: 20230921-pm7250b-sid-fixup-0c35c3c59312

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

