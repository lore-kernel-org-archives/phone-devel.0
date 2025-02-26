Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D5A2253BC
	for <phone-devel@vger.kernel.org>; Wed, 26 Feb 2025 17:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740591687; cv=none; b=HPMKMoroIuk3ulg74ys+td67QjzMRFxaTFXCdQKLetThwbZLO/iZe4u0P/noJ3ej/OtWADPIy/wTYndLhMzyNwKg9Prj62ZZOeBdPYy4eVcCmEwkI4d75LbZb2PQPJgxAABhdeKX6y2WQjfXRqex4odIxnIF5XZ6nJj6im/fww4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740591687; c=relaxed/simple;
	bh=/JvBT/0/7dZvHgQgFaLb0ni7CcSoMNUfe3viymP0TS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kJEW1iN2ShH6EZD/ow2GcekB36FHoUKw+gQZ1nylnuOiHTkRvhrWyKsAEY/S3ApUVwOvwjAHsKgNJLpRgp8q9N9D6PYjGDNU8HANH4m1uGSC0vqLY8yXKFCZDNasQFLV2CFF4QGTGq5xHkHIygturXwYi0URNpBrg52KGwxDjP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QONkdgJ2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QONkdgJ2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QCEToC000617
	for <phone-devel@vger.kernel.org>; Wed, 26 Feb 2025 17:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WceNgE5SAip/l6TR8JhKv+cXYxPZIixLZpvMQwGzGmg=; b=QONkdgJ2bL0Y78O4
	HHz4/6LWlR5RKGGOQy/ZtvermHL7FTg6F7RJkJ4t6t1+fTpn6Rd/gMJX2odqhVte
	TB/TQdpjiMhEnP3R6D1BaMzJb/xEHQiwz9BJgai8ewD3+OjGNJV8ojvAqiaRrrtF
	Kk/sMapYdV6w3CtYuYeT9hdZEmnGOe2o1tF4nPitux4b06YwL1CUJRXSCk963JeX
	lT6kBCcpdCtH7mCZW52ltkKJyQzVPiuYnuWxT9P8ZORXFir/ySiI7zWKzlhOSNpA
	qD9tJXU6rXcBmVCiJDhRLUDGP7bIFuAKMIJ6JNSjoyuWY79UGlQn0fqeuFjc8JyX
	asNOtQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4522skrvkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 26 Feb 2025 17:41:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e662a02f30so318646d6.2
        for <phone-devel@vger.kernel.org>; Wed, 26 Feb 2025 09:41:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740591684; x=1741196484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WceNgE5SAip/l6TR8JhKv+cXYxPZIixLZpvMQwGzGmg=;
        b=b+lDp7X0KbrNgvbYHGGwf+zFKyHYX0uDCBCLRg6NTNQv6jJg8W74hFIwIgILy+DZNp
         r800YutBe747eWj30MEIDY0RVhPSjk8BenYXegzv47+kZ0J2dYxP6sJBkB4daM21wUp2
         ZYX09UJiq0pjlGiYxeYujYvtHqRYtHR5ICJBKUTHebRJ99O58qIOvt8Vc2Pb8MTCNuOX
         K+BKh1DLC3z4TKTuhecis/TsCC0TFuJs7fogu9oRcXU865T7UF4ogFkXrexJWUEUXXAT
         SC2c4zJToLcml5B7Kg3fGbQwglkhh7d2V9NrQ37PUtDC1KbmubdLdMBJfCeP1fvBUv6I
         +M1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXizUaEr0IwSzC0oB78YU9IFlhp/wr/kB1ZGLdenvRpdF6q/N/9TAe/jJ7W38jTC0/VuIX1BZgarxQXrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCOOlSFJeF5p2s42c2AbeLGRPBL8IRoCXofh7bCGrqWI2l/Eu1
	tH6tnxQ5paDgJHvi0HXaEoV3zJdK9doBHY7AwyiJeB6UhryriJOkg3UDxyOFiNzZNTKfsVW8itR
	RHqa0R07c5Qh2kx+eLIO7g4svoWBVSbSb8JI/rNXF0/6UyUrwNpx09kp/nZGyVA==
X-Gm-Gg: ASbGncuSbKZbFnyOWUMUe2p1e9VnD43j7ZTp0lVniHu0ByCZ6naobaqbvUflaoHCslM
	Jcuk8W0vxMCqk+QYDe5ottqAAgb4FcJHFFKob48LqBvdGGTqs0jONSAne/GHtc2Go7crKzoD2Zf
	7v9PjQkOPIrl/DMVuxMusy33OPz60vGEv+YzTFI9TxCunzrOv93ToqxOjB7yQbvuZ8VY0o4Isbb
	AAlWzO+met0Ko3YnLbDZ43srTx5izJA968dC0fNhELfVA9cBbBGBKUN07EJUxI3RLIv/jK+GuVV
	z0B5ADT1MjJRjm05AfvYk7quVfWYEuj3XlQL82wfBq2IBD2RQR0qdi/xCBbVlcxgLXAnBQ==
X-Received: by 2002:a05:6214:e64:b0:6d8:b169:dcd1 with SMTP id 6a1803df08f44-6e6ae9ffd9bmr103315866d6.11.1740591683943;
        Wed, 26 Feb 2025 09:41:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUoD0KqFhTewJuMkxxXFrnwh3b6VH9EZzaLS8vXwnSFJJIp8Wn4VgaZQJTIvs3+vb4T/7G8Q==
X-Received: by 2002:a05:6214:e64:b0:6d8:b169:dcd1 with SMTP id 6a1803df08f44-6e6ae9ffd9bmr103315676d6.11.1740591683588;
        Wed, 26 Feb 2025 09:41:23 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2013973sm364624266b.109.2025.02.26.09.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 09:41:23 -0800 (PST)
Message-ID: <d56dc103-1c60-4e0a-9b40-8e9d04e18b92@oss.qualcomm.com>
Date: Wed, 26 Feb 2025 18:41:21 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011
 audio switch
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com>
 <20250226-fp5-pmic-glink-dp-v1-2-e6661d38652c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250226-fp5-pmic-glink-dp-v1-2-e6661d38652c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XlRnoMurC41ktFhcGoQbP_bWRldXz20E
X-Proofpoint-ORIG-GUID: XlRnoMurC41ktFhcGoQbP_bWRldXz20E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=937
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502260139

On 26.02.2025 3:10 PM, Luca Weiss wrote:
> Add a node for the OCP96011 on the board which is used to handle USB-C
> analog audio switch and handles the SBU mux for DisplayPort-over-USB-C.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

