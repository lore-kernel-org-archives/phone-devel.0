Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C6C3815CE
	for <phone-devel@vger.kernel.org>; Fri,  1 May 2026 09:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627121; cv=none; b=TwfElPMu1C47QNMHJoajR0wfbz04Psn3uly2JRZirVBvh1AyMOvR1DsQvwczJyubqISbZaAXhInF6wzbyy+SiPolELbm17xi8DuixYgmATv2VPgDqIzKZx3M0xjy95i4zQwOJFM6PE4990bFUgVfmNrqpLEokePbP2qeuhnjUNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627121; c=relaxed/simple;
	bh=YmwJZh9JOI6WzIBDXZoUlM82ToEJjTRJKA1/rBWV68o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uODpBr6SO4UZTULILE04W5bbrS3FIfiWRQHOEBAF+HDSJnyh/ca4v8QM/Ahhhq/osB7TrS48XUEu8Vmh094OTmRMnC+FO4Y1TzAuN0Eio6dUy+gGQRVhrTYQumeiXOe7FvxivD3dYkYNiJFSJIWdXEAjplOtFoRgriY57hswzNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Owb5HHBa; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Owb5HHBa"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48909558b3aso18410845e9.0
        for <phone-devel@vger.kernel.org>; Fri, 01 May 2026 02:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777627118; x=1778231918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vg2B5QYgg71nEreyYDVlmpHAn8rPoh5lm0nWaDaj3E=;
        b=Owb5HHBaJ6Ent4NRFarh3IMFOcz7ExYc2HKLgWJAu6nts7VYl/xhyt1cAm15+tKHOR
         tkb5G6XmNDFYvp3qFzBPcsQhadAgv3Ka8RFxnJ9p+AXEg4PkBwTgD5loyft/8tGDAtCW
         wDmmFCezZCIIkZhj8Z34NboLXQpvhRWI18ZhYvsyVDFuE6+/bOdeqMZGaUTF5H/YCCfT
         9921MZQjU8mirMDauvOUHu23qzwWrJYQzSenoRaPIaTJYG7voR/EkKmxtFy68dFJdqZa
         Tm2hwnMnvDdDGqt9JkDYHt/XCHX+cRFBVaGiJtfHG8qc2SV47JN0dKKf5u2aNLNozjG4
         cwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777627118; x=1778231918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3vg2B5QYgg71nEreyYDVlmpHAn8rPoh5lm0nWaDaj3E=;
        b=SrTTem1jcerIBiZKfKzr+g7eixxzj3C4ta+HuHbuwc7YFZZpnjlrMBp2dZGtPmDC4E
         70jFum55/klgTjRNR7hmlhTuxmFTdzgz0sIa4uuX0EKJ4JVeT/qgbe+KXsa7jvoqsIaJ
         k+6T//dsnykFc63/rcay1rpk65nOOp2gvDKwcEAFVRTxsjmx5asGRBFX91tHGkxiL3K5
         uK3ObfRyNM8Bz3EFcuueE0w537oUQ4aecPDDrmg/xFrATMaydUF4Qmrn+WO2cYfk1g5X
         O+9+ba8E26GR41xC7SVMkgNKsBUS6C8iTLOzknDztX5o6lMJ9WmYHYs4UOjNauI8cUzn
         OqRg==
X-Forwarded-Encrypted: i=1; AFNElJ/0udthr1/Bq8nrpyzw35kW68kBRW0oj4MIU6ukm4jwvLVeo7iGuFihQUq5W824mOMvk91rC4ZjmV8YKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIevijmGUAUM0cJge6DfxuAzmky3zCRuXW4MPt7VNb6Kadt3Q4
	fBH/cRXRywxjPus5a7jcbJxqMTOY5STrjyr3/FZDaVYqLBfwuSUYrT4w4P5orV7n53S6FNgXmzC
	SIeUAjIc=
X-Gm-Gg: AeBDieva+v9Rm7kN4KZnw1WxubJ1b4e87iN9lg6Dtk6wasVW/GqhMFmnwCQIQYY8/2A
	JAEagaZ7c/J4RNTo7qOyCGiAz36Wn/CustHtA+NIrXzH9NIUKj2fTxfhmO+JlhQImYKD1WW0kGe
	Xecol9MnkHZ3o60kG0gOVZD4rRFBu7F6SN8mJfymLSpNs5fd7OaZYUjSUKGmfBimLAq59AaMuhS
	OhERPacL6qYAgEzR3GQcfZKoTpnikuuwibV2PsiOb8OOZGXRToHvv6drPkDW872lGzQ3fcotk4P
	qmlhW0jLb2sbJ2mnWWwhOmaNO2SuN7emWKi2TMpEkfvSWF9hf69JDfkWoQ2pOSIGSDrUHFp1EpJ
	/SorWqA/VzsnzW/Zx+CzZnjDpJcHQbGFAVgzR1vjBu+MxBy+ZbB3vE2bIvqMUUE+CTwwaUUIViQ
	VjFthWgZDk53R509KR+96OvlEs099e19sQgc7+cmGgDL+B5Zvtb8J/N99HhWMnmyP3Vu4I+8bNe
	g3X8zJV8RQR0ZlkOj8=
X-Received: by 2002:a05:600c:4e0c:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-48a8444a520mr106471165e9.9.1777627118033;
        Fri, 01 May 2026 02:18:38 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76fd0sm3820787f8f.35.2026.05.01.02.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:18:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 11:18:30 +0200
Subject: [PATCH v2 2/5] dt-bindings: clock: qcom,milos-camcc: Document
 interconnect path
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-camcc-icc-v2-2-bb83c1256cc3@fairphone.com>
References: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
In-Reply-To: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777627112; l=1631;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=YmwJZh9JOI6WzIBDXZoUlM82ToEJjTRJKA1/rBWV68o=;
 b=g5Waz95YiXeLxPaliX00ixcxlQN9A2bYYjj5iIh3hpW01/05nrkK4yEIk0joIYOpy/N+7sWdY
 42tZiGQUEXLCi3azpu7zmtrWAclrnKX/jTmH3tbZOYbMDOWfVi3lQGE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document an interconnect path for camcc which needs to be enabled so
that the CAMSS_TOP_GDSC power domain can turn on successfully.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
index f63149ecf3e1..707b25d2c11e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
@@ -25,6 +25,10 @@ properties:
       - description: Sleep clock source
       - description: Camera AHB clock from GCC
 
+  interconnects:
+    items:
+      - description: Interconnect path to enable the MultiMedia NoC
+
 required:
   - compatible
   - clocks
@@ -37,12 +41,16 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
     clock-controller@adb0000 {
         compatible = "qcom,milos-camcc";
         reg = <0x0adb0000 0x40000>;
         clocks = <&bi_tcxo_div2>,
                  <&sleep_clk>,
                  <&gcc GCC_CAMERA_AHB_CLK>;
+        interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                         &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.54.0

