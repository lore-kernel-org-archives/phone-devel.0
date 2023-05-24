Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559FFC7EE37
	for <phone-devel@archiver.kernel.org>; Wed, 24 May 2023 17:39:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235535AbjEXRjJ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 24 May 2023 13:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbjEXRjI (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 24 May 2023 13:39:08 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96C8122
        for <phone-devel@vger.kernel.org>; Wed, 24 May 2023 10:39:06 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f611ccd06eso9794065e9.0
        for <phone-devel@vger.kernel.org>; Wed, 24 May 2023 10:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684949945; x=1687541945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9LWN7uiJnsfEyNjOznDeARmPA/LULcuUMnMk07h5/0=;
        b=QVTMLZvIGyBaGffa+cYsRbbyWSH9YND8mjK3yKtJqG7CVJCjjIk5CpoPw5vwoZ6EMZ
         +8jZYHtYWKzWYZxRJDLk2jhTEwclHcOO+JoD4S68n8VAxdCfG0ejwkUBJqoQcjiCDXDb
         QokuPlBDRyzweWvjf1hrFOT+FXH/qFWs2uMeh7yG9x7+B6150r0WXvuDr6AHeFQgu8Sw
         XAhnp3febfahckoK0bgKQMO7cseggD0Q7tI6Ty1LfmE85rxlQk5EsbM/gYZPbwQE3VL3
         z99us9221ChW2Pm0HtcqO9QWb58r94DIhGoUkyGny0iYxQ/Cqa8RHo2PSWNTFHq9UgPt
         oyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684949945; x=1687541945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9LWN7uiJnsfEyNjOznDeARmPA/LULcuUMnMk07h5/0=;
        b=TPfC6fLdDEDUJfe5QIb2/xCJu50bYWHru+xZxmrUML1IabROtl9goNN4xfITOqXQ3g
         WkV2CjL7YF010Nyb8KTBypko+sfG/sJpV7e4JPixl3cFYdNS2SHPQaRr+28Gs+Q87Zdq
         iYue49crahyby9EqJ3zGvCX8WlfyLUWiz/7OnwgsXcb5KNYCQ7QpeLhTXdUZXDwXzf0w
         jUAiIRCBZLhCkwxahuS4gm7lLVKLi4/UjFw481OBnJRUO+vgrFC0/BGmGo/lWMYztQsp
         /vvPxc+lceOJW2BbsIbaG3opYZQIIOrhtZJJjdae11kimYS+HojaCnXz++DVBG9bWJd9
         wWOA==
X-Gm-Message-State: AC+VfDwWAy97tB+1jNAFX3qz9/z2B8dk6+JBuwXiFw8Orph+4n96+NP3
        l9zU4Q0MPDmCGXdhH9jwyhftCA==
X-Google-Smtp-Source: ACHHUZ6utyOsCujwcaH3IqRsd2lxVSn7kRstpKnhFLpuJ35Mjoc71xY8Hsd+n5TtjxAKDBpyKoTMKQ==
X-Received: by 2002:a05:600c:205a:b0:3f4:26d4:91b0 with SMTP id p26-20020a05600c205a00b003f426d491b0mr356360wmg.40.1684949945545;
        Wed, 24 May 2023 10:39:05 -0700 (PDT)
Received: from lion.localdomain (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id l17-20020a7bc451000000b003f4fb5532a1sm2993053wmi.43.2023.05.24.10.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 10:39:05 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Wed, 24 May 2023 18:38:54 +0100
Subject: [PATCH 3/6] arm64: dts: qcom: pmi8998: add charger node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230524-pmi8998-charger-dts-v1-3-f9334afc4505@linaro.org>
References: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
In-Reply-To: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=NNDml/1564JCkxp4dIc4Klv6pOfclI3jdMcVHpTokFg=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBkbku17GQF8dXNo/HVnmsz1mMD/IIVAuw3CA9eM
 Ps0gvWMwfiJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZG5LtQAKCRAFgzErGV9k
 trIdD/9NBEHFKzHaJO3liPlBu3wM3dwEPca5dBIXw8JFedjgBhKn6GgMYND7o/9N8dGI5MEhCWI
 n+OMp6EalyTjyEsawfhMD7sC5PY4C3szGtPApGTvwzWIBcC4FOngPZkGTdpFaATSySOWgKsH2Xq
 0wQTCv2N/YZaQHTQoxDAqSWjR2Q86OJpX5JZ2Q9V63OkQVn8nXSPLoTRlP/wQwr8COebDzxxBCl
 Pw76hhrIGtKz6BxNXZ91U7GuecVrP1mmatcoK5RAVtKw7FX3WJ9qeECc74BjRMHL1PA7M+23MSF
 5O4MNcBpioQadZiGECMTIjYJDSJ6iCbgd58dwNqIcxUfS7/LVtZNUvlBuy+D0AW4AU7SmbjcqF8
 tfC1ZpYJJftM2MM/x4u+1U7PuEVp1eHbRCxhyjn3MOIJuK6eGPslPeC3x2sDaKsJ9kfHzg6A9e0
 ue1or+F/agnS3yd0S+4IuRug8p52+vw4tgT9bNgsx9NWGIJY5Hh9rB1SjPCHVLiCgsGNZ4S1roF
 X+zMHrjgOB5wHdxaYSqM43KnFaf+/v3rsEz2gEPrUneY7oQblOOwsjVq7hSZEiZz9NlBhPm6Yf0
 RlPA6bN5jlXrVkTdF7i85rS67CDiNJrNs/RC4S7RAAo3KPULYNUo7Vi+Jxio3/QblSBuS7bTs7j
 deg06g66Vnp6gsg==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add a node for the smb2 charger hardware found on the pmi8998 pmic
following the DT bindings.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index be6f60bfc26c..73f51451d21d 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -9,6 +9,26 @@ pmi8998_lsid0: pmic@2 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmi8998_charger: charger@1000 {
+			compatible = "qcom,pmi8998-charger";
+			reg = <0x1000>;
+
+			interrupts = <0x2 0x13 0x4 IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x12 0x2 IRQ_TYPE_EDGE_BOTH>,
+				     <0x2 0x16 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x13 0x6 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "usb-plugin",
+					  "bat-ov",
+					  "wdog-bark",
+					  "usbin-icl-change";
+
+			io-channels = <&pmi8998_rradc 3>,
+				      <&pmi8998_rradc 4>;
+			io-channel-names = "usbin_i", "usbin_v";
+
+			status = "disabled";
+		};
+
 		pmi8998_gpios: gpio@c000 {
 			compatible = "qcom,pmi8998-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;

-- 
2.40.1

