Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C52303A01
	for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 14:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759242759; cv=none; b=GEEvxPBA3aSICQ/evn2MFuPPebLQ9GM6Y0VHUwb9dioiII9/jXFhGOf2RBkwJjaxJkgyZjI8FRT8CYALlzP/1qD59D0VNMvHjLMtrExPoj9uwY7GtVMlN923vAwK5H19mz3rUm/iTa90ASrE1Yn6Htq07IQAt+LKASSG8M4kZzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759242759; c=relaxed/simple;
	bh=6XDKwZQKKm/HcS7Zce2mlrECQKgBdlxp14xSsBBMKeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SpW8q/0HIFUbLDOKQ1aJ/CITfTfmYrfMEF5UdKswwmbu3pWWCAar1iwuypP2Im6DDcZ1zWeRpw4wGPnhrPCt6+1hN0rizYklCggal2mD0V8l+W5HquPTOWw4a1Dscd39RGSyvFAg73Qa3J89bZ+XwhrQ+l7UFuPH9yf7RXC4Z+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ofl5p9HW; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ofl5p9HW"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd68bso11014224a12.0
        for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759242756; x=1759847556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KpqDsPljIbI1ydAAYbBHpL4t7hGd6BLoLJu9kFhmW2I=;
        b=ofl5p9HWVxP6mVHwljTBWJBRTcn6XoAS+z4rAO+OceyTP+aRnPEoqGdjtqo5Qn2S+q
         IYBtkgFY1xwtQpg8nWEAZoXVYCzkjEzFHNR39U+LjqTHdFQv5ww1VAldJpMnlnCtczdF
         CZEvDL/qcQVblV7ySz4fVUv/RodROa1Hw3fyl29ZoowKPm2Zhgny0ODymrs/WWlvmY9G
         +37nc5r++8OIjqmlO1TsGvvIs33hoAbqySVG0XdzsShkPjTIc/no3iFGdZYBXvEb5s5K
         eL7oQEsPAvUNqw070L+YefsfsKr4Byx1l+XI77TR3Ew3WVcVSuKP/wiDaupnu5Y09/n8
         w/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759242756; x=1759847556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpqDsPljIbI1ydAAYbBHpL4t7hGd6BLoLJu9kFhmW2I=;
        b=KkYmfwX8i/nbB1V+dJu1PjllxMspVEn5Uqo+52QPrdgJRk3gF18A4UH0DOOEpSKMFo
         bnIB84K5eE8AT6C6GnNn6vso5bFBRyD8Td7F13V+M4g6n0vhlRYNatXbcY2Dh/eGJQ/u
         gzQByvB8oBG9R1su+MWkuQf/R+pNQGwg/UDn9mRdJthONTOloMffcrl/f1SRewv3FTRc
         BRQJhgAcMPZEsHZl78qD8PDbZUEq3olVxRZmqA7hgQv7D/IP1esfVE3jPtsZHrXgielj
         cBM5j8CYnHOxyA1F7rDJLclFQQKKmOl0GLlE0La5gVmnULB8NKkoyzbsQm/T0PudDgkU
         WXNA==
X-Forwarded-Encrypted: i=1; AJvYcCWdfkBdyhoX47gWqwwF2CX7BYoGzb1SsodTchFyM2E38adScUPZoc6VyAruc4qeZurMuUXp3Es7twJZpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS8IPodXepf5SWUL1zWfbtrVU0l31HBOZaSpEDppBdS/b3ow3H
	ntvKs9G9YUDQck6RlOqoI/kO5IwN2ctES8XQRyCzUuZzqusHlow5eU02R4zIkIhZAEQ=
X-Gm-Gg: ASbGncs6EKvK14G+vX3H5UVAbG+W/OZeKr0vwPE3MWlKD0wwNjzvlcUzHcvrMeNQfy3
	pzR4mte2ncsquNWuRun6R7ZbsdBSaBtL8SaqcT5eb93MrUYHazTcoEKrtQ0bxoy5rDOcXWKcIBb
	8/taj77AbZXfFkcFsp4RQTeSxP0r5zrOYHHgQij6sZnF62RF5ImFe/vSOsaTz/xR7drm0vdbzjH
	Z1iQAFPzwBIWNUYoUDYD+ogwQG4tm1MxG4SIpf4lh22b5oyV8hpl+07UNmHZV75ENUpfi5/VYq9
	wdZq49/1/3KuR25FZtHA5og2+M7MZYhNfNpWDqGrzNuBOiKCvuXfMDe3842cuNBmyEyB9yIUXVI
	TRZvduO9/a2aD60uF665PQmoxpmKptbNrpxzTv15ZPHtH5eYoM/PPTss/xq8dDxJn8o0wEHIEjg
	RVDGvcxq8G2yeqa3DTEQ==
X-Google-Smtp-Source: AGHT+IFyvbxwgP3khFMfvK8Z3FvV7VS3kFyp8CZVMqy6iYYE4fRT64Yn3WmDZTXMdlLdYOJtArGTow==
X-Received: by 2002:a17:906:c349:b0:b41:822c:ce76 with SMTP id a640c23a62f3a-b41822d0d02mr385052766b.14.1759242756474;
        Tue, 30 Sep 2025 07:32:36 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3dc2cf61dbsm499858466b.29.2025.09.30.07.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 07:32:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 30 Sep 2025 16:32:21 +0200
Subject: [PATCH 3/6] arm64: dts: qcom: qcm6490-shift-otter: Add missing
 reserved-memory
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-otter-further-bringup-v1-3-7fe66f653900@fairphone.com>
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
In-Reply-To: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759242752; l=1048;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=4H+1X8ibBwQxx6F2/tlczJd/Zh53oYpIpneYTVnsrY4=;
 b=MkEj4fc1gplW3XRkFyG+YTnbELDyh++lWP1rydH0MJ5KRTho9D8HyWL4lHZBs9ii40y7yz1h/
 I0/PtM4t3HBAl9nJXXzVR7cZtfEEkrukBKYGAJP4Of2svukfI89BmB2
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Alexander Martinz <amartinz@shiftphones.com>

It seems we also need to reserve a region of 81 MiB called "removed_mem"
otherwise we can easily hit memory errors with higher RAM usage.

Fixes: 249666e34c24 ("arm64: dts: qcom: add QCM6490 SHIFTphone 8")
Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 2efcfb631c3683456794b0a0cc5686f00efd329c..ce794ca724db6deb39f7fae47912c3fefe974573 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -118,6 +118,11 @@ cdsp_mem: cdsp@88f00000 {
 			no-map;
 		};
 
+		removed_mem: removed@c0000000 {
+			reg = <0x0 0xc0000000 0x0 0x5100000>;
+			no-map;
+		};
+
 		rmtfs_mem: rmtfs@f8500000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0x0 0xf8500000 0x0 0x600000>;

-- 
2.51.0

