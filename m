Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5875F22157D
	for <phone-devel@vger.kernel.org>; Wed, 26 Feb 2025 14:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740579040; cv=none; b=GGdZQToYV+0MvehMUthfS8Hg3ccLrxYPuQjWcmB6aAZKtD5HtZfaR4f1bRfNSJxzd2qHmjmpG4FuByZhZ4XBM84Ldd7E49qSyWmDHCITb4kZNF4ixMAX5FAzxNgcwXCf1GF39ESNXlJwaWZQFfw//gvg/0pJWeP9VxfxO/yZ/gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740579040; c=relaxed/simple;
	bh=P7w9OXQiQrKC5xuGSyYgTs9k0mD2TUTs1hwUynrSPC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f6txUMkwRKiGsrCaE+iLCsuK289wr6KJPKwznqVIXm6oxtl8yAecYE0j39A426Aqx19cdGm1OkgBLbz9UcexmIWfqZ+wtmbhlZUk+BzGV1i7G+7JrwLC/MESWjgcTj8T4cCEqX0lTsW+9aSOYve11uthSNiVSuif6tTd7N1aD9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=MxaouGYJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="MxaouGYJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-390dc0a7605so368052f8f.1
        for <phone-devel@vger.kernel.org>; Wed, 26 Feb 2025 06:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1740579036; x=1741183836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJ9yHxHTj9hXoq8ESuMoLUnH+h1yWDXZJ3MZuCpqRWI=;
        b=MxaouGYJEdfbeIs4mLifJnIf/UiqCok4NBWKZi7lbtX5Z6EZvh8XMKlO19NEAahmcp
         MW5S9VCd1Ocnr+Elp02Y/S9rWJGLFKVeJu9LxouTTTgq7AhlxC/W79/KBk5OC85gmKZU
         M0xMdgzIJQ+4sXXzzw9TB0NvWPPnNc//cPlp6PFR+FxxdAutXdcNU7XbvcUve4XC4od1
         IbAZi5THxDKhT/N3uKVy4afDtFAt1pRcqWLF2QlrQtDudZzJdo9oqfxftmvqurQ2lB4A
         AGtIYQ31kccN34l5Un30vJfsSATwZ0Byvc8/AEJbSQciFIYxqc7Do9jPWpbNQu7dBaf1
         OSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740579036; x=1741183836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJ9yHxHTj9hXoq8ESuMoLUnH+h1yWDXZJ3MZuCpqRWI=;
        b=xMoW/w5JWChkj+bWH9gmc19gPnN4CcWE+Hw5glaPV6HOOB3JC5pvEu/OomFyA3/W0p
         BhZEv9kbultlI25tobSRuaKBwo42HOfIQxMJzJSu92ez8bZtVDTgx+dhkk6G4vyl4NLR
         Tra92bIheT6/n+nUJkOOk94zJJcYB161G6gscmmiwjTl2glny2K7hURysE88kXL3ztS/
         iYIGPRNHwjuvmDbJR9Xp3RF79dLowkNPV2m4ffoMuoeuaDqZFK/LX16NJoQA54x4oZmX
         5G0f7iW086FRbxhZIu0A3465GZbpybvX4iEcxjQqpRFSnDLaMRCMYHBXYb/ATRMLfDMX
         f9Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVzNGsSl36VlAkSwGp0L3ZSC+Zxt41I9NULBY9c0KWQU2Z7wkiQqKOppFFwY+kLdJBjJhH+t/d6QbxjIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7YquUNkO9bNU345cHNE6ctqED9gys4vYCqvfUMFV/un7BdIcx
	+zHbS5R6pb2aH8USE2X92CRwxOdds2lHeXibvXQCzC5C/iCfqq0IAXGq86C5BPY=
X-Gm-Gg: ASbGncs/zLTNTZgI44BDAZfB7uqvv5Dge+QHb3jw5XonfNfT6/hb50reLfzxj5rY0z/
	a+0WczHrv4ATAs/m39fZp/BGSf+Ye+L/45dIY96/APP4iQ4WiNbBx1djBHS3M59D8LabmIKNs5r
	1XJ47/z5m+1sxrUc7DDJzhToFpnX6aAdM1vefeG7lQ/beaSwLk6wfcEJcXq34EzywlezzKV9RFY
	GJ2N3a5VXXIwPyF2JfzQwgU5hSRTquX/3ZzJMt/kWSA5XvLj2byJeqTOiVrH8ljZ3ESLnVMrvJp
	wzXCFWy/11oPDG0ps6EKYj9p4dXHlS+PqCv3px7eCHEOdFwJbBw9J0UmHFyVquyde/WPy0JGdnI
	=
X-Google-Smtp-Source: AGHT+IHFry1L5wTMtQdP0z3fvjIAfQ/KnpnPkdZsEzieuHFdzyw77DYAj9YLwJb0jc6fKY5zmaQvyw==
X-Received: by 2002:a5d:47c6:0:b0:38f:3a89:fdb5 with SMTP id ffacd0b85a97d-390cc5f6d66mr5664563f8f.11.1740579036576;
        Wed, 26 Feb 2025 06:10:36 -0800 (PST)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd70be4csm5755889f8f.0.2025.02.26.06.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:10:36 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 26 Feb 2025 15:10:19 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011
 audio switch
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-fp5-pmic-glink-dp-v1-2-e6661d38652c@fairphone.com>
References: <20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com>
In-Reply-To: <20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add a node for the OCP96011 on the board which is used to handle USB-C
analog audio switch and handles the SBU mux for DisplayPort-over-USB-C.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 3c134d28e0c1965de55356af9c19c1331b029669..b3fc37dba51523ce5678ae6d73f7d835f8b26d9e 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -750,7 +750,16 @@ vreg_l7p: ldo7 {
 	};
 
 	/* Pixelworks @ 26 */
-	/* FSA4480 USB audio switch @ 42 */
+
+	typec-mux@42 {
+		compatible = "ocs,ocp96011", "fcs,fsa4480";
+		reg = <0x42>;
+
+		interrupts-extended = <&tlmm 7 IRQ_TYPE_LEVEL_LOW>;
+
+		vcc-supply = <&vreg_bob>;
+	};
+
 	/* AW86927FCR haptics @ 5a */
 };
 

-- 
2.48.1

