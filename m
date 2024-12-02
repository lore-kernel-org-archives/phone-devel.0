Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776863BB48
	for <phone-devel@vger.kernel.org>; Mon,  2 Dec 2024 15:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154309; cv=none; b=lBvaf/3yTH6Nkwf4tTfkqJUaLREaFFQy2ToaDy+vUpKHi8+T0r8HHdMPbwYUxSaEEiIQ6T6B62i5DFOfJhghDtvpl0Hr+putbZCrcE5+rx04AN0cvydYp6avFfH5G+FMulSkBIxqF6fVdawNYD5r+3alOyGYOP1DtrP1GjCa6zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154309; c=relaxed/simple;
	bh=g9aUICujfvbjpqeM4w3JMq2L4/zhb7YLW+mfp8bRqU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ug5ocAe4/2lc0I94MHmWlgP93eGf8jnkDFGR1IN2lrovK5ID2UQ2mecuBDHklu5KiwRVcJaEefQ3UEMNeljZeX5WdVs2o7TJr/2a/FoZAmNucaNPBOKcS72dTWmKCN41AEuJDiPgb7DcpMEp3hQp3eFxvSs3A68m6HNljgNZIx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yRpuJQGm; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yRpuJQGm"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434a766b475so40853345e9.1
        for <phone-devel@vger.kernel.org>; Mon, 02 Dec 2024 07:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1733154304; x=1733759104; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xXCuDP180luZ4JePdaAEPqLFzpR2coh76lHb7Z0CuU0=;
        b=yRpuJQGmtPcp/0xj+LTQkGBZ6UtxWROEWBR80euqB8nBcEPVp4ftOh2ElW1Nkq7nhE
         gAUPsTNKLUysXWAOLsFFwJDCvBUlWElLL0KLtWPnsiL3zZgk66MpKWw3lrmWbYwdKzdZ
         O0iQUe1wGUkbglDOeCKGuUUWJ4vYtoPrkI+S67MV7UsYyyFepzMqhnsW6OCBbcuJ4aQ2
         l2I6TR/C7mPi18wvxN7HX/n4L1SreMq3ZJRAdj6ZpUgF+KyeopLtTtVp/8JcDiYXkEKX
         1Ebd8Ennu/olGPWKoA6oo7NSp9+MlQwKGQHqcbYwozdW7vYgBthMylWHs97ArpToVz+9
         IQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154304; x=1733759104;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXCuDP180luZ4JePdaAEPqLFzpR2coh76lHb7Z0CuU0=;
        b=o2KV5SXVcdVnx3mwytVnbWlqAkVHNa6yd2uIdxEegniY9FJg31VXbIQZ7t0Tgcz0kJ
         z4RQHjEE1I5RUY6d7H6Tfv/XcbH7mPUhXQwMi1H3CBN/DsOZ2PJvc3BAk5a8yjvyDro9
         ytrKmNV46Vgl+oStbZzIxhRMzOu6coYXCfRUvUwYtSqCWK6JSnzIfFCJkNaubd44k1Am
         Qw8M65kzt1sJ6HISajXebosO+pbnyulQx0mxAin1Noufbvub6a4bMWzPcYj3zh1ywwDh
         5NKpUkkP/F4yV8WP/qo8tqa1xwmFKi4OBKj3WaThN7Ad34EQfPIiv4s3UyErtxr5tyzG
         eZvw==
X-Forwarded-Encrypted: i=1; AJvYcCV4RNTR8ajYPNMo+9EeTCAhoWJnrzs7g5onWe/4XbYJ71LCBGq0t+VSlzxlb5Iujl9Q2+61eoTifGQF7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YySJz4HinTvrg1RLvg82desE6unew1PbCtcAvLet/2bbTrpfDBx
	mqi2gKC9cEuwEhV13le4yXU7m+hfOtKbieF2g55Q7GofR+FymiYPK0v73ffeedX9cIgDjGeniqS
	9XKQ=
X-Gm-Gg: ASbGncvF7ot1xkHp0P4qItAEYSqd71DwFlGyCxNqoMEs1mah+Fk+i6zJRm7Her36bd3
	loW7NteTwZs3eas3gTNuWywaqpi6yytAGtzRKdmHsVWkxwhPIR6B34kgbO4QIAZHq3UrG8bcitY
	I0a7F2Nnf9wmLSbceoBnLWSYETMAV8wS7eajoZOq41lGcpHFC2/Pd0c9bzcPODoVvoJdBJ7xmvU
	o8/HqRz4Ix2p+X35722pZW107G6aETkONdzW1sBZpgy4bQjAaFYc/WJemPdaWp9tBv14Z+XjwCZ
	vxu1o/a2VJlIKP9ucAy7Wh0=
X-Google-Smtp-Source: AGHT+IGgu7NcMFp/eaHdVsUxC15X5VcowG3qWNXAtBMGKtwV64OuR/ITdkzi/tMktSJ0w/eSu83O5Q==
X-Received: by 2002:a05:600c:510c:b0:431:52b7:a499 with SMTP id 5b1f17b1804b1-434a9df270fmr189824075e9.20.1733154304558;
        Mon, 02 Dec 2024 07:45:04 -0800 (PST)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dc63b6sm155711085e9.22.2024.12.02.07.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:45:04 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 02 Dec 2024 16:45:02 +0100
Subject: [PATCH] dt-bindings: power: rpmpd: Fix comment for SM6375
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-rpmpd-sm6375-v1-1-12a4f0182133@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAP3VTWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIKFbVJBbkKJbnGtmbG6qa2BmamGUamhklmKepgTUUlCUmpZZATYuOra
 2FgB4/GQDXgAAAA==
X-Change-ID: 20241202-rpmpd-sm6375-06582e126d7f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

During an earlier commit, the comment from SM6350 was copied without
modifying. Adjust the comment to reflect the defines.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 include/dt-bindings/power/qcom-rpmpd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index df599bf462207267a412eac8e01634189a696a59..d9b7bac309537cbfd2488e7d4fe21d195c919ef5 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -65,7 +65,7 @@
 #define SM6350_MSS	4
 #define SM6350_MX	5
 
-/* SM6350 Power Domain Indexes */
+/* SM6375 Power Domain Indexes */
 #define SM6375_VDDCX		0
 #define SM6375_VDDCX_AO	1
 #define SM6375_VDDCX_VFL	2

---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241202-rpmpd-sm6375-06582e126d7f

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

