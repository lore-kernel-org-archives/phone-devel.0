Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991405;
	b=I8BId2Jaa8Q27dn39kNNI9+pJX+v4ym8zUE/iFO6MRaixlwa9ak1o7RhJJzHtWC+BiY0
	 UWZTgKPMHJPBY+/lj8HUraiRNeiL+0CqRn9TUj5J6gU9pRhuSKUtjHmd30blFaSKcx8ht
	 zM97CnQFH0ox+rvkahnVT90n+BbbuQxz0P9qVS+8G9TClRQm2YmSV5Qp6l52CWNmlVGor
	 LP2INRxYWfLyg8sQqzTd3/+K687DtXXnjafU+/uE11G2PEqIsy3W3wW1L0fIoKw/tQPDq
	 4lscuhW7WA0g+7zKw5a6sKfo04rI+q2VqYA78pJVHJzEVW5ohHEzmTyCnrzD0RqJA3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5IRKp4iJN1WKUODGpMx2UOVXoN64/Wy7hUhFdDQsmKE=;
	b=eFLpBtG3Prjt43XDmvhRFITwHfIWHN3cCc2cnV8HTSIlH28p74a+3tlZWFACN/RjzBKE
	 aVj0yVmi1Wpdcw5VlJWZZ3OtVNEfazU4UAf0HcPfrKSONDhr9MFkHOgftD5vzdzP95SGM
	 5cjsHB8qVffRub3oXh80GR2qeg3TKYaZQKEx6qjonpmf5DG1LVsrXfa1rpApBCMLfXupJ
	 TntOIQ0bKWXANNxrrrIb880iCHtPeqi7OYO31y4oxIbxN6HkPiBtdhtuyZZuCSe+XHR6Y
	 F9q1qPfXSq7csBXzK2DGjsBUbxsxfTbhrPPgHtn0wJeiRBfqZ8qDAsy2U1FuALtVbyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjW9wJMx;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA93606A31C
	for <phone-devel@vger.kernel.org>; Wed, 18 Nov 2026 08:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CA93606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjW9wJMx
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1096149eec.0
        for <phone-devel@vger.kernel.org>; Wed, 18 Nov 2026 00:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991404; x=1795596204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5IRKp4iJN1WKUODGpMx2UOVXoN64/Wy7hUhFdDQsmKE=;
        b=RjW9wJMxBIaMicc98otnJOiMl0a1Yu3BFmOqdcpDp9B5AkZJr5Hox6m/x2IrOo4xHC
         IF+3eFwuS0Ymf+BE1X1VGW9jHnvT56gUg4zmnV3298ZZ1IVExtqDffg5jaOEm2bDowfz
         rvxkclyiwP1y54h2htM4Q0SCk5iW3rt5klpywKPH7QLiqw1jx+W6Y+i1qVMH6pHekANs
         FCGXtZ0H9OA29PD0YAKTCCgWoWQZgM63xd2OwswLmRypebAUWriQ34XKT82JzXRE+yPx
         /ZnSEtE7WPP9lUPOWdknOLhpbrA561rFilQla9YLThJMPlmjDo5JT3VRx2V85Udt9PBC
         QfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991404; x=1795596204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5IRKp4iJN1WKUODGpMx2UOVXoN64/Wy7hUhFdDQsmKE=;
        b=cVNnxI0OokbNn4FD4GzgBlIL/F8p2bNNo0kVGit4llH7NWAVvX1LwWYNr0mjUqVzi+
         qmImGnTMsBiW8bU1Iwy0Tq72yZ0SucsykbBVjCPyZU/MK0KEqOzeXk0OpL8fi+T1lBX/
         FV62ZU5PGW+S7kNQHjyc6W7/ManiRoQngTcikAc6c98V7IZ/5mFI2utbz1d15bATJvNc
         SBP1pBr368MS4L3Lb3eIY/AJc4G1k4QapshnJ6G1644VP5ZqBvQWQA+OcYcml22j+VSY
         6P4vEPVCF3VhPW8GeAgJFV1TSpQSGYQ/twrl7E/u7t3oHOU8480jpxlY4LRflf6L4FPk
         WIOw==
X-Forwarded-Encrypted: i=1; AL+hErHbMVn/aQpX4utIvEjwU1tLAADgsAfTM2ZC4BOBIkm47ZbnrKuISGoOBg/77VNQ0FfqlxlKXP/CWCZh+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+g1fMg+hvXTFkEpRtgy25zypbx1G3x15PUkZ+q4Mw/Bam3HJG/
	lcqiEYEX0An+n1miyd9Y33Q72W66RkiUEiV8QkChi+HA+9lzWvY8JM1S
X-Gm-Gg: AZFdTZdf/6LUzdw8yiwUS8jzMUVNDV3FWYcQvj2ZKnjsjykTvIhYhoVi3XruQzFHjnL
	xb4HBvvfOGd+bDTjHaR1Qu0XWjKybYASt5vtE/6cdyjnriyxZOzWkDCo7Ohcyt7yYVojK9992la
	fgX5Ei6LJ7hQQdXHrc+1X8IzdKIr7zEOTiPkgRC2/5q1AbREkknWt20Pyx7e6OTMTKHkSvdYhSt
	+IGcFopxlZrgp3waHZ35Q/r4NrdjqhiqB0JYkz41hjZFIiMV/9xkK8tUEuI6s+FgYPvC2kyfKsy
	ja3unKF2er8JXFkq85EmJWYVLxCdjpml5otJ88KOEluhii0NVm6dp4cbL5XwmaSBp129gx4c/mD
	quKi//322bhJhT6L0lcFmMEdmdwrErVPPXHl6n/bdg+sG/YOykIKrzy9a42PR/sBJ7jWZ+37yLj
	fCb2eQqE+00YSCH2tPzawQJGuW2K/lbJTQE4b/Y/INoxQSX9iNtqd6floBE5oXmC9D3ODXtdc16
	u/zsgnj9M1tDCRwnnUbbEhDfHQQvCvvqZyhPFJElhzsM1XYcby5po35m9qVn2MbuilW5fnMlIhp
	hqbR9jV96NlZHyEbSUd8Zvbu9HlJwY8Vdd+10TcbHgp/1wJj57/yF55qzDcICe0xJnbVCnU7uUa
	xgbAB9g==
X-Received: by 2002:a05:7301:6f0b:b0:36f:f3b7:6dee with SMTP id 5a478bee46e88-3828101fb1fmr2002654eec.7.1794991403757;
        Wed, 18 Nov 2026 00:43:23 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm5508771eec.21.2026.11.18.00.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:43:23 -0800 (PST)
From: =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
Date: Wed, 18 Nov 2026 15:42:59 +0700
Subject: [PATCH v2 1/2] dt-bindings: arm: samsung: Document greatlte board
 binding
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261118-upstream-greatlte-dts-v2-1-bc2f23ce81c6@gmail.com>
References: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
In-Reply-To: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
X-Mailer: b4 0.16.0

Add a compatible for the Samsung Galaxy Note8 (SM-N950N), codenamed
greatlte, which is based on the Exynos 8895 SoC.

Signed-off-by: Trần Trung Nhân <nhan.094.vn@gmail.com>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 6ac7f895351e..088995a32a03 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -247,6 +247,7 @@ properties:
         items:
           - enum:
               - samsung,dreamlte                # Samsung Galaxy S8 (SM-G950F)
+              - samsung,greatlte                # Samsung Galaxy Note8 (SM-N950N)
           - const: samsung,exynos8895
 
       - description: Exynos9810 based boards

-- 
2.43.0

