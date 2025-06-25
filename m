Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734BF288C80
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842719; cv=none; b=a6mOrAu3ivGsTcaMx1UPhxsJv16n86kvaXqHdMTQFacc9ibdFm+0KHwgNgV9MNzgkMu/ninu0/PxD1x9Q1BgRTWXv3W35efX8ZztgmIYrVvhfg7HKaTWcoEJGF27JJiESysLglwh9lqMqOc7ZCpDCb3V3O7++HU995GQtT7ShPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842719; c=relaxed/simple;
	bh=SWoJLZ+dAwecor+TOe4oNtuJVNwOUsyqw0DV73+mFEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VH2z1+pGhOhor4+hw34tqFO77sYIr98EqXJFmssF7qYldSMY5xbBw73u8RYH64gco4n0f8kMpXIi7Afzvg1okjSKJiuJDdilI/r4vAWPk4G83/uBKMYs4sRMoOC/EwSaoHlF26lpex2zPAyZ3NPQSsJxDKRmKmDt2D0nc8nBicw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Vgh6Xkhy; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Vgh6Xkhy"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6097b404f58so2405384a12.3
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842716; x=1751447516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iBfI+QaV8mcmTB/8Ck8ODfSXbqU1EYKGiuZpV5V0BI=;
        b=Vgh6XkhyeNytGecrJ8HzqTEKXTblCaw4vGBzWpWce8dCLqrPsgXE5zNIjEXwnjkaq3
         wB0GnWNyNqabqMgsIGPHoCQIn1J0cjYjeNKfvqBj/JE55yQuDQIiP+gcLGF4OYqCygx+
         lroKBiKt4YOkDlTt67dmeWPhRd0nh3MIndWRYDduarXqrt2DdRZibPRcgkpFWbKKkS5Y
         C79L+Peia2iIK/OsujfFEsoYc9t/R2Fu6VX+o0CVz4yegyqrz+npimv1Ghqd24uoy2Si
         4Q/9csLJ7y9QD5Y72ugYKDOkdTtYkR/KjyBt85QaN+cVB4OBQfJkYPCvJjUst0wP1brD
         Nspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842716; x=1751447516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iBfI+QaV8mcmTB/8Ck8ODfSXbqU1EYKGiuZpV5V0BI=;
        b=W9DZ4FdQipBnOrYzjK1ixts/TNRfWgFr3cTggcLYYBtbdHaL37A5/jPpRWh+QNZ/d+
         dVZaW09l5y68yX58XwfqqGTi+M1Mf8h1Yljw9znYN4NEDn6dK8wlTPmrQ3Vx9gSHgZpY
         QvipxDyIyCBYGWyoL4g23fcAgjtTO6UHwCsjsxVgc5k2nT0xlHsmHTC6zaahv2gm0vmr
         DZrt2KAqEitT3wOmHf4SZ6JPcy5dMaxeAuKbsSkp+DsQzAvMiPH99krf14er4ZNW+Dnr
         luP+QgurQoubpjUVzmthQaQvkxmDPGhPi/pSDtnRBuQPVv45Mr1AGdcgEmglfT4npraN
         aNEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMfvK2mEWiIMoP26ymFnj3Wif5HyUVUBlPQmu06wcFOqQRdmU0Ru4qX+jrUyey6Sc51AR79nNsmksj6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiUF8jZQ8ZAUToKn2S8s/9Q8+24qqPBI4Zo72/Lb8/JjosofQh
	0a1iyX5TV+RPmCayIGFpBKEZ8u5Xa6MkCCkmzk1EebRzbvGDPYJWhWfuOo5WGZ8Suks=
X-Gm-Gg: ASbGncv8BmYMATUzgNrjYAYEG1h5h5rlKhvc7dJSKIfMvMG8sPsFKcxFEWVTU7kK3hr
	1epE3isYeOvNbxQ/YglcMCdjaPRtAXLoVyiIQnaYvT4N/XDq8oL5B/ygfj8FqMJUMzpovJ3MFkH
	OgtRucnXYiza6wTXRNkPim/xoDHVbipgJc8iKWqn9JxaVfiAX+FAVzpE/Ri176+ilojte0qjE0B
	fWXUuVsgQw8SQKmr8qEA4VcWvSteFw+I9SaUKCrzyVLNlltIgyhgLRA4PjqKsOUtLp2vuZUwAgW
	dxA8VBiqy/IIVD92qJ0yShDVlUO1zVm9uhMxjNe1CAUt1nDXbMh9lq0wIQdyfPP2OqkttFxIlUl
	lqE4XWBvfGc9fUpmaIVcwT4rs3fCzYlGM
X-Google-Smtp-Source: AGHT+IEFCyamn8Gh1klBPLOdRYVvpND5wYQyMw6FuiMzvHciZFa+7Sb1ZsqIsd/lwHhws9e7uzTwQg==
X-Received: by 2002:a17:907:9808:b0:ae0:bf55:5c48 with SMTP id a640c23a62f3a-ae0bf55634bmr214177866b.7.1750842715569;
        Wed, 25 Jun 2025 02:11:55 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b39e0sm1007242866b.110.2025.06.25.02.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:11:55 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:11:46 +0200
Subject: [PATCH 3/3] soc: qcom: socinfo: Add PM7550 & PMIV0108 PMICs
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-socinfo-v1-3-be09d5c697b8@fairphone.com>
References: <20250625-sm7635-socinfo-v1-0-be09d5c697b8@fairphone.com>
In-Reply-To: <20250625-sm7635-socinfo-v1-0-be09d5c697b8@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842713; l=683;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=SWoJLZ+dAwecor+TOe4oNtuJVNwOUsyqw0DV73+mFEA=;
 b=I5TbBGEVucxOuhvzyfNPjWUWZgL5WTKu3QEEsQZCI+ImKP+Ag1EMBeJ38SpPt23/7lQKYB99g
 Uf9LPEj34osDuaUNgdry8B4SIsRF5jDRfVKhU8qzqO5QUtNi4p6Ar6s
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the PM7550 and PMIV0108 to the pmic_models array.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 57fc2760548aaf904cd1aefc7fd7e0f7bc269632..a094566f70d00dce3ab0f21638c36ec28b973543 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -126,8 +126,10 @@ static const char *const pmic_models[] = {
 	[72] = "PMR735D",
 	[73] = "PM8550",
 	[74] = "PMK8550",
+	[80] = "PM7550",
 	[82] = "PMC8380",
 	[83] = "SMB2360",
+	[91] = "PMIV0108",
 };
 
 struct socinfo_params {

-- 
2.50.0

