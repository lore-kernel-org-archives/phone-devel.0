Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637BC386547
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654891; cv=none; b=SYEPGM+nhvhH/uEQGnVgtpN7Q64zGp4IQ3oFgR+KsQIvQRIdhZQYgWSZh2TsAF6JzPP/YtUNTtwGTOA7vu8VPwH7kg+OqHJunsRZzL0g+Jb0CUpDNdYKWuxOKctkTNQtw4fQ4UsY/PFji13W0VKbz8P1NybCdlTftB4qKIoyfzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654891; c=relaxed/simple;
	bh=x36Pf7vElbRsW42CTmbTmfaBoVMvQ9EKr11WIULr0uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KUIaTd4PxIa51QYHT2xsoRaVqykQ0IJcXC0eM1Z6F+oAGNP9YeFHV889htjplC6EOITchP4/PgFz6rKWf0kcQNGUmafNmCGH9l2kyEEMSOx0PzwwKJQmHRQ6lmQzUltoNU5c35xH4lrL7qtkqxauiifpTCmY70Iok2+4fXxmPxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=grssDVon; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TY7Y7jru; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="grssDVon";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TY7Y7jru"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64dWA3777679
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 09:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jgyKpshH6DcsqW7WgVfc0iBx2A5lJYEfPD7KMBdKPZk=; b=grssDVonOuuas069
	ZQMjYtOaqoe/WkYbmB9D7tRmyT4HO/U/RW7DU/BQn+7USUNYjPZIHZm1FT+NnJLV
	rtjkW8EScvGl/jjLfmB5ncJurIlSVWJjQnMR7mBkKYsYCdGgo2YJ1OCYfOnJEnr5
	BwXh8Rk1hxk7B8o6ayK6xdbwOqDGN6f6MuPuJobiWnBXGadfyeZ3vAERXDV1er9g
	3DILPs1h36HMoU0OtjKraQTn6lAuimzOdQnfvIaM+uoQCcEh51AjneNOK2tRV2H+
	TISprTVQbU9nPHYqeCd21svGUCRxpnKDFP3RpEe284DhJ5XP2VjTVUMxrXpQIYx9
	RfweLg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7w0xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 09:54:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a081737bbso46290426d6.2
        for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 02:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654889; x=1774259689; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jgyKpshH6DcsqW7WgVfc0iBx2A5lJYEfPD7KMBdKPZk=;
        b=TY7Y7jru/XMvSPVvetWy1rnNRzsSQ48WBWp7kR24F59P5fcuoOQPyKWA6q11gR68RK
         3JbvA3qsZ7p8J9d1OF1z7vO/h3We5rioiLIcslAVfneEDpwBfITu06pHe667iZzXusmp
         TN4noMbM0DpmC1FHnQGHOIaatf16W0NLDkW8mTPIAVGX+lZ0Pmb6XaiBLxSjQUcvSnxZ
         xiZSjQ49vyunoJrhuN86G8tzI4luAev7J827YKPMkQj6RYPCzF2q8ZgzfRZR4QT8uIt2
         lKoLBiJfV4cU6g3JOxIBJgPcGPBnIfGycUmXuKaxJSr19Xi3aorXwYzGxtsfJAhlHfkh
         Q7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654889; x=1774259689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgyKpshH6DcsqW7WgVfc0iBx2A5lJYEfPD7KMBdKPZk=;
        b=JDIl4q/Lq0EB1Tt+I2GhUYDKKemykqta0d5J4WhawZ1RXLFlrY4kBzONrMqTU4wGTd
         rQ47HTlcohbkQ4H5snCOSSpXpoTjDYXXaOoRYNa1D5ufRaDZWERcgBj0OeqZjPitGDxb
         kQwZrDmxZWYlZI3Y+Kl1ZJJMtkA+teevfqVYZdzjLO5hM1mgOWv2/q6Jk9sle2YpXBv1
         JnrWwAiej8KJanO4DobjYXFbdpX0YzlhbMduswQpQK/1DlnYB/9OU7TtArd66eNey6T9
         OJSoBLWOR//ZW2is3e9g8SphxxU3K64TVOBGynqD1VPG1UH8GoLjnR/zaiOA8Llbk+Zf
         Ettw==
X-Forwarded-Encrypted: i=1; AJvYcCXtzmO7YOSWtWPk2JTmrtFNSn8k3SjsfoRq6Cb592D1T2/n0olaijdBO1zQ3dtbByxPDR45hNKlNqs9GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpzxtBdeNkF4MXPJ8v01RXXuz09/pB8XXPP5zRfCd7lZSA+nQG
	9jxkc5i/x/6HxDacfmm+cdvfeMtoIviRHW3NW16EnSrlvZKGXcvA3pAXFkNVwcGkAhkdLjTSKAC
	w5r9rD+p/b7dWNg0xqSHL9C+W58yTzucJi0V9pdyo2SPvozZqDBq/AfokiLao9Le8rw==
X-Gm-Gg: ATEYQzy/iiiNvkNy23x8LYY0Gjmo0BjcUnauy4VqjtMUMsqhmpDFsGRuOgZzSQ8ekll
	8DLCsbKHRerxuuMsZhoLZoAG5z8klYEk5jCBf7Brg4KFy3tfQ0zvy8jasxXhO6j/gsrgpfWbApv
	oJhAgMEI02tveVAZh0+nngbmg+MzvBbwV9sSkpLWG1F6/env777w1NkrAVl2hI2unI6bXaJ6qo/
	j9M9XDcLV84+VBV/lMv7aoG/UWmj8bf5pg1zJSWAdlWHYnem7dUaNgy7G89d/5F5hHfpsr3ZVD8
	7yZyDGd7tuMB1C9AakRCHumHw7rWnv+lb2OmYuqG84hj8RjktjByWPIkzykUKRzL0jD3M6AVPrj
	QNs8rNamVZ7n5xc//EE8yF7toJbaf87AGKQ+PI2K6ehG4VVgkTqfw0WJ/ERTAURg3pjETaxa+TJ
	BBYow=
X-Received: by 2002:a0c:c350:0:b0:89c:47e4:41e9 with SMTP id 6a1803df08f44-89c47e44552mr40701196d6.6.1773654888701;
        Mon, 16 Mar 2026 02:54:48 -0700 (PDT)
X-Received: by 2002:a0c:c350:0:b0:89c:47e4:41e9 with SMTP id 6a1803df08f44-89c47e44552mr40701036d6.6.1773654888233;
        Mon, 16 Mar 2026 02:54:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cc19b84sm532803166b.21.2026.03.16.02.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:54:47 -0700 (PDT)
Message-ID: <df8751b2-0546-4d66-ba13-b16f8c0ae595@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:54:45 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] arm64: dts: qcom: Make a common base from Redmi 5A
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
 <20260315-riva-common-v3-2-897f130786ed@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260315-riva-common-v3-2-897f130786ed@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bA0PVuu_NagIKregQGjC6czdIVHmvw1_
X-Proofpoint-ORIG-GUID: bA0PVuu_NagIKregQGjC6czdIVHmvw1_
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b7d369 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=hBsfu5BoBQgbZ9FLN5YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX4wsyvpw0NRUp
 ODsxvfK2s26xIQblvyp6jLiiscyEXj63NFrw5BTUcivKbxkhIUwi/nASbTGfLw3EzoWU+Ox5fhh
 PPfOjRxKsciYtCiJVDL9uHQdUiQrA/NRbgLGoEoMLkqUpQ34XbzgEA+bylgSJ2j/0IGQgVRnLcn
 zGlmKJg7XV4wgBCNEEV3jrfjAs1qAXH+shcMdLtfW5duETuonxSANG49x65ciCyxkpkxcOpF8MQ
 f0Y3i8zasWrOqWSJ0HZTv+z4zUMNXhkcsEJih3GbmXVgX+THZH4b642edBGl2WWcY6ns1BLapuu
 isrxtY12AAOW2DPmDYueA2dg9nFqBl7u9I6HB2/laNY+IHk04P9nG0K4kogXMynV4UQRxkCddY7
 qmhs4WkkhnnNRl9kGkm6ZphEFWaYphpfX0UgjPR1SidgaSjuZD8PFSR52YC9/mieE83AslDFp5e
 A7Jaq206nF8Zp/23qjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075

On 3/15/26 5:26 PM, Barnabás Czémán wrote:
> Redmi 5A was made by wingtech like Redmi 4A (rolex) and Redmi GO (tiare).
> They are very similar, make a common base from riva for avoid
> unnecessary code duplications.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
