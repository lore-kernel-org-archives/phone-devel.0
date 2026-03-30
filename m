Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A5D3C3BFC
	for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 10:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865676; cv=none; b=l2MW2OSD7/r7ADzl6KhOXSwQ7PRF4bFiTnjwJd9TErZPjjKzEn+OLzVd9GiFmYrJe+uPUl+UZvf3otA6cxuenhp3IRj7lYDmXtHeqqv4BdncQKIlBBrwa9yPqHeD9weJDsiDwHGYrC6U/rzcpOkUDUpLwTMCB7syXXlJFPoiLKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865676; c=relaxed/simple;
	bh=spVe4EUNVFlJB2QdEc96OFgvjKCHaL0PLCg0uw+Bke0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BsDSr+EZM9Rzq1kewtQ4IHPwvZvdApxPerXueVYXZcpeH//3XAFip1UrNRkvnGWXeesIcrQeU0pvJC6DSBxCKp/ro5ySxXx7ITZfTHLL8xbGa45GlUKxRxL1rJX2BxTnHYeQQQ/W8tLgKZU5h4Oj/fkTWtPD9ctghC4/1ZMaeWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJfPQAG2; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJfPQAG2"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-829afe24fb5so3024048b3a.0
        for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 03:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865674; x=1775470474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1XVgipd/TT6ujaFT3/XiuBYTRFfr7ZfTZaRy1KGDmM=;
        b=SJfPQAG2gvjArsgafQ+L0PoIVewB2WQh87knwVXw/2Y5SeVZQfNsqp1s9vZ3JHoOAm
         rlGKbPHelqSaT+td+cqzJRZSd+Puo4O2YvHI542h+vy6vp3LM1UfkvWqPCuplEr3jZgm
         Pdpr2heqoCBHISDCqGSDLSlD42VLIy1Y3N7GOQ6d9hf6X5moO/gsfnKwooSgI/cSB6IT
         gBcjc7nQVoED/oZB9pfnve8gRTk5LRVFY4WQ0RL343GEQoLB7Rxk5pbVX93zUZ+ugBMn
         ockt7YGCkX8Mcb5BbG+lLia/48eWIL552wdFuN8k139vCmitsTwLoYGFDjQsBSKux+L6
         nLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865674; x=1775470474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I1XVgipd/TT6ujaFT3/XiuBYTRFfr7ZfTZaRy1KGDmM=;
        b=q83wxLsm0hklh4Swp2Il7Zom3BYkMx5kPDA7l4K31HmEiYm2Rs9uLoI+U9r1eBXX2u
         KZO0WUb+OdvwLwtFs14aEYzS6ocfYVXk1FCDIZEvDsWiV/hNNfPl30pzSbhPL8onSM6e
         A46YVptxM1YQirqRhKPliAThfpB+4td1LNoJCtK8VzLMSA5wzw7UgEuRqCrVPBWu6HR0
         VsK/Wypb7w6YHxXdRVs8ADF4RABTNSr7Jms+/JOuTXZse4wa4yFUkBjtiJ2gi1kQXn4t
         o38GGzXfQrJlQgYrzaBV8Gr5o51J/PQxfjRMhIIg7HqdR9oTJuZsGvMTkiyre5FZOgn0
         +t/g==
X-Forwarded-Encrypted: i=1; AJvYcCXu+mDJqrMvF8Ha7tM8cyaObFouDyqkacLONabzQ11GDMpGisbeNLBLjSYPA4P8bKqLxC7m0Uik5MEHsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoo08bPTmOBRsO0k87OkzTbUFSNAenAs2il5MzgKd8NhoTixtX
	7eDBO99lKxjL504WFmtycas2BZuG8KhmLPZEpMexbTbN5/4GnK+W8jlf
X-Gm-Gg: ATEYQzyZdGTQZgAiL9SmqfSYWp+hG/65x4Ps4a2S+mzCx2EuKk+ik7oCVcKB4DmGxHy
	8eNGb/j+INTLGbzsQOvPZ0yKTIl53myan4AwdOg6dNogrgEvskF76j6ndszFqo56fHR8PJsRoZt
	3lRv7gsZQ2ObuxZfZJBj9kqvS6Xmor2BuSkzuTTaKbGGRE3gdLgLH6StCdLydQjOUJIggQvoDv1
	Y3hgO+KxU19+gVSEBfseCzJCmTPnnKwf3AVr/0frTTMD/TpzslnTL2P/ZMSA5nGJZsoc8ZLfy7Y
	qxT7ZM+3eIyYe4iPlzcnym5BXJFz96+JNiq9PQacoBtfWkQtuE9o2vKVPDyKXCEaD4j/ouo+b9Q
	JAu/XAbuBCU1p4o/Vh8mEkjw+vS8Aygxkl2in50y5mALODGSu0YhKDfQqD/Y5WY9zngynewzwK/
	SKzmVCihk89nQKNDdmsnoTuBP2uRQuRN0sAtLzwvQ=
X-Received: by 2002:a05:6a00:1495:b0:824:93df:6d86 with SMTP id d2e1a72fcca58-82c96036e65mr11779450b3a.50.1774865674423;
        Mon, 30 Mar 2026 03:14:34 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca843d8e5sm8286080b3a.5.2026.03.30.03.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:14:34 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Mon, 30 Mar 2026 10:13:49 +0000
Subject: [PATCH v3 2/7] dt-bindings: clock: qcom,sm6125-dispcc: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ginkgo-add-usb-ir-vib-v3-2-c4b778b0d7f8@gmail.com>
References: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
In-Reply-To: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774865654; l=1915;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=spVe4EUNVFlJB2QdEc96OFgvjKCHaL0PLCg0uw+Bke0=;
 b=NNw7v9ceZUsctwz0YvIUnOV2mrBB63atvgyvrQ82fLAnWvBuN/ux6B76TiGmJv0mP3XHayamM
 CVgeFYNRSpyDqongSmEey30Cq5OezDMrbgrvjHa02mfdXn4uwluMlSf
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

Just like most of Qualcomm clock controllers, we can reference common
qcom,gcc.yaml schema to unify the common parts of the binding. This
also adds the '#reset-cells' property which is permitted for the
SM6125 SoC clock controllers, but not listed as a valid property.

Fixes: bb4d28e377cf ("arm64: dts: qcom: sm6125: Add missing MDSS core reset")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603150629.GYoouFwZ-lkp@intel.com/
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 .../devicetree/bindings/clock/qcom,dispcc-sm6125.yaml   | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
index ef2b1e204430..a177a1934b19 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
@@ -42,12 +42,6 @@ properties:
       - const: cfg_ahb_clk
       - const: gcc_disp_gpll0_div_clk_src
 
-  '#clock-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
   power-domains:
     description:
       A phandle and PM domain specifier for the CX power domain.
@@ -58,18 +52,16 @@ properties:
       A phandle to an OPP node describing the power domain's performance point.
     maxItems: 1
 
-  reg:
-    maxItems: 1
-
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
   - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -101,6 +93,7 @@ examples:
       power-domains = <&rpmpd SM6125_VDDCX>;
 
       #clock-cells = <1>;
+      #reset-cells = <1>;
       #power-domain-cells = <1>;
     };
 ...

-- 
2.53.0

