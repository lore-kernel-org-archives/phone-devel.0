Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5AF30AD1E
	for <phone-devel@vger.kernel.org>; Thu, 23 Oct 2025 11:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219475; cv=none; b=LGADxMwWWx6MK/PWZ6G6k4k7ypNDdBOiYc4ZA1KOXqYAjEix/qiVOUE1wFfY3tqdXQ37sKtihJlRvGeKP3Gkjo/moiLf3pI2In4Ac0eEIk/OeRCuBSKUfOe92o7A4PFYKZs73hk2Ueic087jrt2JGuzsx7Xw8NA7JX/eR0s3W7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219475; c=relaxed/simple;
	bh=7oXf51m7mBPucNidESq9CXB9+ksqBJvy/yJfCr+VnSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=svghGmQXoWMp/aNlZVFo1YXyIYg4Exqnmtc7K2YM6r3oE2TIF1yjuEMjmeg85rng/deOyj9R7K58f8DiUWmCeN/4sDgEDfeTeC+o82kHUtECbZLLoDSr9MamjIpHXdCpjEV89CjwGcgDy+D2Df8/GQHXJOi6I4pYcV+jdXWbaOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=elvqjNP7; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="elvqjNP7"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b4aed12cea3so133880066b.1
        for <phone-devel@vger.kernel.org>; Thu, 23 Oct 2025 04:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761219472; x=1761824272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8kmVxRSYUQArl5tDapoiE287uiuzt8v/x5S0PTvLP8=;
        b=elvqjNP7Ekc3lmFjrFFuw3OK9UKWaIB0Y+0RbrgmHv1kFufut4ZcCQcfahv2U2YhNm
         NEzXJKpo1wi1c5PqfeOWebAWRv7EGXAlOmulpGNzdYfSt4rZIDSI0Fq4DlKgtslzQ/gj
         Sh/IwLXZWXugDnFSB/nj98VseWxwQUJXOcba6bT3nPfLJOuCL9W4N05xd10DXlu9JvTp
         Kkw3GT6VZhrqUi4QYS2A699UoTFjig9is78ZZyObY6bZWKE4hfk4c0S/saHJWMLLkdJn
         vPNjitSxFMPFD3khc46Kly2UsMe2FgncfNxO+AYyf/2XUKnfyy0dRil8i+Qaqdywh+Rg
         sXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219472; x=1761824272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8kmVxRSYUQArl5tDapoiE287uiuzt8v/x5S0PTvLP8=;
        b=GwYIqdUPJmyqZK9kG+Ahij5IJk6Nlsvfm+hqaHlEzvhEsd03A/6LeylotWtUYclo68
         NO0YPcobQsv8twrBcWnevK7hdyxJoTnp3eeUAebjH+VBH1OGpXjp7VEV4xJdbxM0onkP
         HJYWkQcU4XoeABhjcjkbomJkgSTHW3S4GBzK7iLM6bYiihzIcR3L+8TJAPORMFYURb8W
         PavH6BE0hydyM10W9S8F5e/1DQOcbm8Tbcl0Yl+ES6HRd88LwIGAQjxJiXTFXr09PNUj
         at4OP/ul+iDUIFkfjJ8k2WDppcNjyF/0Q/FlV31nRmdHv/IIc6S8M7FRTsy/0L1XSM2W
         190Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMRU5aAqfJS+S3kpWsClLdkUKz/S0GrbijrJlQ7bnstMooCEIuJ7pRo1VYnpNcijDhjXY3BeitiqGX2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxcAsMzplbAhcIFxiMij2eAhb14sG3bzn3XQVi9/f/HPVTAepi
	j5ED3nmtitZh/1eAD4IvQE5zmz+SuW+iXtfuEh5dmx4414mYe2EPVomOB/zLeenpDQQ=
X-Gm-Gg: ASbGncvSja2T4lGAAPDwCLgvB9H8hg9peUEbFz9CIPyJpb3QwEWwEYdFdg6vsqH9YuQ
	DL90WVmRiR0e3zk8u0yWCFJdea2eGUt7xtlsyZdu6dJnDgh0wfr6q0Qu7TGbSsCUlMtlptHIf2N
	JaxIGG6akEkXBYIlKJKpDilQCoaqhmPqHYczxQTfj93BAfda9OKNUZbVvq9G29vDHY6OYIwHRH4
	PsBd/F+Im8EaqdVTG8yl6UipAb2fPycBPLfWYWyTUeBfT4BLuuGZ3kiXrdUG9eC2RxG6RqGXjPS
	Lu2VlXg9Um3yZU/7gmJd21w3Tt1K4x9r55Km9DUXelb41h/fF6C8bM35acnJp5poefV+shzuRGh
	FpOkPxoqiy1PAw8vc4Jphz8aKzojDstQXlATOP7WCNWTzRgLa1VYWnfbUTD+hw2K3YlsXJHAnNb
	+g7xznbIlsJYbpWK2TT9uo2Fgo7oLDeoMvONFnXdLFXljH0g==
X-Google-Smtp-Source: AGHT+IEzcSqbV8G27b7RK+JXHjk+tt6rrpOdAaKPcwm6vc0BDCjPnkJCoc2TFrnWl+dB/W48T0b3nw==
X-Received: by 2002:a17:906:4fca:b0:b50:a067:2d85 with SMTP id a640c23a62f3a-b6473242850mr2602673666b.15.1761219471693;
        Thu, 23 Oct 2025 04:37:51 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d511f8634sm194429666b.29.2025.10.23.04.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:37:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:37:26 +0200
Subject: [PATCH v2 1/3] arm64: dts: qcom: sm6350: Fix wrong order of
 freq-table-hz for UFS
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-sm6350-ufs-things-v2-1-799d59178713@fairphone.com>
References: <20251023-sm6350-ufs-things-v2-0-799d59178713@fairphone.com>
In-Reply-To: <20251023-sm6350-ufs-things-v2-0-799d59178713@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761219468; l=978;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=7oXf51m7mBPucNidESq9CXB9+ksqBJvy/yJfCr+VnSk=;
 b=oXxHWyHCtwNqMCb25Ee7HIvzFWo/1Un9PghwgUi78155t7dSqhCLDn5o485ACX9xKDx66k5I5
 wHE14dkIjU3DFqmmpgw4UrtEb1U/qUWEiJ5KlLNG6Sm6iMSRNaPXsjd
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

During upstreaming the order of clocks was adjusted to match the
upstream sort order, but mistakently freq-table-hz wasn't re-ordered
with the new order.

Fix that by moving the entry for the ICE clk to the last place.

Fixes: 5a814af5fc22 ("arm64: dts: qcom: sm6350: Add UFS nodes")
Cc: <stable@vger.kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 8459b27cacc7..19a7b9f9ea8b 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1180,11 +1180,11 @@ ufs_mem_hc: ufshc@1d84000 {
 				<0 0>,
 				<0 0>,
 				<37500000 150000000>,
-				<75000000 300000000>,
 				<0 0>,
 				<0 0>,
 				<0 0>,
-				<0 0>;
+				<0 0>,
+				<75000000 300000000>;
 
 			status = "disabled";
 		};

-- 
2.51.1

