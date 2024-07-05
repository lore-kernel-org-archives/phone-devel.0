Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07159149E0A
	for <phone-devel@vger.kernel.org>; Fri,  5 Jul 2024 12:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720183216; cv=none; b=MrM7zPcOpZ8+qnEwNGXTSBuOV53FI0iESMl369efWqlce5VC3bX6RoQCiFSvuKE4TYEr1zNRFn8BVjCAo0uOr5etAWadP3OcNkG0dPACwFf84TV+i/HiEZREbFM1ep4lZ82vpsoRXRcxHVDy+e6NGIFnD05hb3AXxucqgljBeP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720183216; c=relaxed/simple;
	bh=h8RQ3gIuXSb77DJPrRwPE3c59rwl0ZIme+E0cdb67fU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pLI03zTLzjhNgzja9TNX/DOEMLdzCBcVEl2BnWj9qzb/ES8LtvkFJqoqhRO5CR7dLUtD8xFD5YH2oDT+EFO+1gs09SIiec+QjnC2B6N5hQ3Q54uWqu7+gRFagbVEp8S8hU+MYP4CarmPjsYfaz3oJyTIRMJ2st5g4ynbo/Am0hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=RkHmvkCl; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="RkHmvkCl"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52e8b27f493so1875922e87.2
        for <phone-devel@vger.kernel.org>; Fri, 05 Jul 2024 05:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1720183213; x=1720788013; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/PLu2I0Vdf1hwlHNvhPaU4cM/LFvM/NCf4ja1wMxoVU=;
        b=RkHmvkClAvlU80oY9lxMB+HtgUHuVvF5LBPTnmbgRrHL9l3792OkLGMYeaInsJPLgy
         Tk8GGhumnadQIdjg8dseozqzhrViRVcOg5JqwFPl6tFnUrFzAzeDl/8O/eYLitQlqyUV
         l1bkOFeN9mqtI+BVb8LoqaO9h3EQmN5941jP3dJUBuFWf8xLAtvPmCHzwTAKcWSY4YoT
         OUCT8XoTNJ6gu1A592o/RdQuTo4kgRBUiG8tMzRDwDa8thYW5OpQ/oWeZZxZQ8qgJhA+
         AsxWrgvSDS3DU50jEZMSu57pf5RNQhzKAyxySHc6cgLG5nQT4MXWVQgXL50LbgoKD/pZ
         tDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720183213; x=1720788013;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/PLu2I0Vdf1hwlHNvhPaU4cM/LFvM/NCf4ja1wMxoVU=;
        b=sPLIYQvOHb3e0fguUXMkk92VNl3vPOVl9LKugrT3mJCy36K5EBRRqd07Ye1XRa9Xcq
         OdZVVqoYI9KU/7lgXniPPRROCjfqCQzwRs8jltTrb/ReXcj9jHcyqoSRWHcAnIOD18UD
         +Im6XuPNcK7YuJI1R/QPoo3JbNbTlxD2YiS41F6V4W/1orD8xD++yNZ42hZU4wdsrQDy
         AOLvvf3b215ieorkqvUIl8ju/fVWk/xkNsoZH1FhSZmZ5CnxCVW2jkViIEQhYyVmVIxF
         tmsfAiIeM7xUIcRoX8XTmsreMZnXawMNB17KvylsymOjYFbIvKfsSkKBoq5j2hTmgES8
         S6fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmXQPoJw5gSP+hFy92U+VhbuXtmsyTkRBw1lOzn93SdfH3wXXlaGMv6DQcnjYJyK3xrhkIWTAZMvmrdhWqAnAVYvguoA5DhPGQe5I=
X-Gm-Message-State: AOJu0Yxz6hCTSj1gntFPTP0cyH0Bt8fWp6MN5aQEX5smthAscLCttm2U
	kg06JsFo7n6FAtD9oEbMrZffrexV6UNbQH21T8/M8iDwlBKIy+uy39ao0BVBZTE=
X-Google-Smtp-Source: AGHT+IFIw+YdwZKpWaElCgPPGZV5ODZPThv5LPqh2kUnionfeRKB5Dchz1f1F2h5P2OOB/zufsW9ZQ==
X-Received: by 2002:a19:5e1a:0:b0:52e:99fd:e3d2 with SMTP id 2adb3069b0e04-52ea06de234mr2794396e87.66.1720183213052;
        Fri, 05 Jul 2024 05:40:13 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77d0908f51sm40930666b.125.2024.07.05.05.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 05:40:12 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] More thermal configuration for Fairphone 4
Date: Fri, 05 Jul 2024 14:40:08 +0200
Message-Id: <20240705-fp4-thermals-v2-0-a4870a8d084f@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKjph2YC/3XMQQ6CMBCF4auQWTumLdQiK+9hWBSc2kmEkpYQD
 endrexd/i953w6JIlOCrtoh0saJw1xCnSoYvZ2fhPwoDUqoRkih0S0Nrp7iZF8JXT22JBppBiO
 gXJZIjt8Hd+9Le05riJ9D3+Rv/QNtEgW6q26Ntrq+DObmLMfFh5nOY5igzzl/AZjckJmsAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.0

Add the thermal configuration for the thermistors connected to PMK8003
and PM6150L. With that all the external thermistors on the phone should
be present in the dts.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Remove polling-delay/polling-delay-passive=0
- Reorder props, e.g. put qcom,ratiometric boolean prop at end
- Put in 45degC 'passive' and 55degC 'critical' trip for sdm-skin-therm
  instead of dummy trip
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20240105-fp4-thermals-v1-0-f95875a536b7@fairphone.com

---
Luca Weiss (2):
      arm64: dts: qcom: sm7225-fairphone-fp4: Add PMK8003 thermals
      arm64: dts: qcom: sm7225-fairphone-fp4: Add PM6150L thermals

 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 212 ++++++++++++++++++++++
 1 file changed, 212 insertions(+)
---
base-commit: 243741e78f0c8460fe2e76ef7b241c6ec5b8e28b
change-id: 20240105-fp4-thermals-f3c8e0417b70

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

