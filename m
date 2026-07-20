Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68CD30569D
	for <phone-devel@vger.kernel.org>; Mon, 20 Jul 2026 08:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537300; cv=none; b=iNWUWFfNIbffHa8hg3qlaCqauBe0SXpbn1EcOASSHicMvO7Y4UUmCCl+zLLaOPKZhshpG0PADGO8ARJB1Zrgz/FEsWR3+9aZnbDGoa+8NYoqPkKYyB17FBlbWZtvqwyrS7QgOUCzvxerdrhoNShOawaIoRWuX0kGTGwocuQWWYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537300; c=relaxed/simple;
	bh=88M6mX6+xZtRa4h/hGHs/FKdReIvDzARwgiR186i8hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZBmd2GI07wjBcxMiEWGNoVHu/vtvS1JSPwdpWC2PzWIzUKhcUrnNLD3YBelnyK6pEErnL1k7rE7+zwNvxjLNS9Bf3fIcPyeJKpCqGI+B7ybP2vXJ+t8PKFuyHKLL7apv2+c1P6kOTsOqMF2W9VzQpff7mQQGVglGKlEANNA1OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o08ESG+p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WW0aAtZl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o08ESG+p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WW0aAtZl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RSlA1520049
	for <phone-devel@vger.kernel.org>; Mon, 20 Jul 2026 08:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a1JTH3wU3Ng/OHTb873hnii0bjM0B9Tou7rMYKtlqNQ=; b=o08ESG+p8dccA+36
	tYS1jebgUwu9lTvO3u3UfzFH5ivU9r7fWXjQnVwkvQBKexewJoQLVMUBHaC3ptw5
	HAoml4/Wn6koksiGPKTQGidsmNyK0YlgFznbBmrB2k1kwdH9JMBohGkctEa1BJLO
	GT9EeqSqQGtfJgsKLprP6ewmA9oaRvgML1hvhrsiLotlu1A61ZgkTXyCl+tMQcYO
	vIqTPrRcn0/C51JSwNPvgQUwxgkzm+/gCev2O8XP9LwgK3M1JMzg5jf6R7qMGwPJ
	nVdBX+GVMXc7B5aHFoJ0s67Z1Y69wdczrq2fQByI3H7owtp71zqe6m+IuaCUQnzl
	4ryI+Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chn8q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 20 Jul 2026 08:48:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21be5bb4so30384741cf.0
        for <phone-devel@vger.kernel.org>; Mon, 20 Jul 2026 01:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784537297; x=1785142097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1JTH3wU3Ng/OHTb873hnii0bjM0B9Tou7rMYKtlqNQ=;
        b=WW0aAtZlgm1YYlvlLp+umeF6stziGWejMnD+BBPQgWLMLXuHmeOy556/JeijF0VNq+
         R0XWlzC0Yw9Ju/6sYIS+RAHTX9mVlwZMyoXJroTP1a+P5U/ZrXUgAA1VLTB4TANdJ0Md
         uuUo7eNNZoZFtObg+l7xlmTFt5d4Bh7Yn8lqAyEWKQCsARjZRAO3BSlye2UswPFSDjv9
         C6UnsnQze4r+bblewqmJOOxDLhA+64SQJka+IyEnaWHvybXcls0UbcGXX0b4019wvl++
         ir6dafNdcEcrnP9M3KUP6hFb0wICKzJfRls9pAHZyHmHv+Vcr+WRQmtIvUzk0cBXzq0S
         qTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537297; x=1785142097;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1JTH3wU3Ng/OHTb873hnii0bjM0B9Tou7rMYKtlqNQ=;
        b=OIesjWS56eaz/QqRrfahrEIO4GJClrjLCH8zZP0tJaxOmC6XW2AZVV9Px8emP19F5I
         sggVn1sSGyjq5hRSPaZPwDt3OgiqrLROSi01HFuJid93GWTJNTcU46OeqKsB8pURjgPi
         AaZKfKgD5jxtEkAFW7G1W52SsxaSfKEUu9KTrJ37t8fR5MQDzhIq2Y0Gn1ybieXSUHKb
         IhunqVYsUId2O0+VE7OUrmeW3urvf5Py7rEbNwwHkHZVQlmZR7KW9ZM+aofXh+9RQ77D
         qknKcFAc50P88vc+VPg7o38hUsEZyc0XlGrPU6xuDWc8Ly4YdlzskVSmzGuLWDuhT6gh
         mVEw==
X-Forwarded-Encrypted: i=1; AHgh+RrUE1+ByyaADfNFYstZorlH7QPX8gJ9mk6w6t0xUiHB28SAP+hYa1sn6T6YeIAa3QvHU/6/xI4OaDPs7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHsBjutnZGvVY3YCmQsNzqd6a3aCO7+ipI6XRf9dxwZZTnz1Wx
	qBUfknTkGN5w/BYsf6uE5dKEuuJwCZSI5BqY5JVRGP1HqfCtHqPPHU52G5VdbnjOiZ6vsR8kA2E
	JiTeoZGJLXk10aQ3fzKHcdYvPG+I8posUfplDkCm+BPx2QsfopfnW5Xl9+QNKUdDLQQ==
X-Gm-Gg: AfdE7cm84xb8pNt4Uj1Py7h1q3eCww53w3Pp2rOu/TdqYg/NbnJAx/e39DGCDCRwu7W
	GDDZdxCvHvOXCzmnMoStAtu6VuhMaku7LDy5zOcfxQcpjlN2YewtgjiS6d39ZRFDSWZfgYFPn9h
	ZZCrcT5Ef8qauEV4N5mSq50QFfjvuEplXv8Pm7hSaf0mcN8k+Lhlr/zOd5thysOLlIIuPxI+VzZ
	/iRU21Ed9oXkJKxJhesG1CEilXWDWkEp3upgapX88PwZeOJRk81yuyZFmWplzDtcAlfhmR+SXEH
	oLALYLNq7RIpTjKpUeyAplfRwZeW/AWnT4QoAWRWPcW+Rv3QSuySu8Nm7NBpkOP6+pJ78tkV13p
	/zQmI+/zdpSktfM0rm8CpJ6s2
X-Received: by 2002:a05:622a:2515:b0:51b:ff1a:3d80 with SMTP id d75a77b69052e-5213e67f307mr107117701cf.7.1784537296903;
        Mon, 20 Jul 2026 01:48:16 -0700 (PDT)
X-Received: by 2002:a05:622a:2515:b0:51b:ff1a:3d80 with SMTP id d75a77b69052e-5213e67f307mr107117451cf.7.1784537296423;
        Mon, 20 Jul 2026 01:48:16 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5fa23sm428198266b.39.2026.07.20.01.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:48:15 -0700 (PDT)
Message-ID: <49f442b5-0d47-4f63-877a-76ddbcc92959@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:48:13 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add CPU-to-DDR BWMON support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260717-milos-cpu-bwmon-v1-0-dfe0bac9898c@fairphone.com>
 <20260717-milos-cpu-bwmon-v1-2-dfe0bac9898c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260717-milos-cpu-bwmon-v1-2-dfe0bac9898c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5NyBTYWx0ZWRfX0fC6erDLJQA0
 /pK2m3b//MLRUSHdLFIN0fGQs9YI/asjF9IGVwd+Lpr90PE8yvFF+Obk4EGpLInP6ZR4Kl11qaP
 tu87z5yBfSg98pPKw7FVY1csRtx8VOk=
X-Proofpoint-GUID: nQwyLg9HM293DAcsqkq33uMih0RYCKPZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5NyBTYWx0ZWRfX47/BvCaTFqBE
 fysV3Hr+kXwQPvmkznMK826k2tS2xq27NrvfCOFhgG8kCWH66dk4old57yX+BY+KZC8FYGKC72u
 279KLrdoX3I3R6Q4zMqSCthIidca0mPhX1wbjex8P5RO1SeieM/kiX7GTQtE2lMoHZMqyMj6gXM
 3Kjw/NIxBA5SA4Z905HF9mCWbtznlBGMRC8SgImhqMDmerejpRIygvIj5U5hdivI+rdgDuApWDC
 wpsRTaI/cc8A63x0QJHus9ylu2WiGVYhp2f9YqAFW0R6AeeI+pRQKXhGsPUQ/qu5U9zTL47fd/7
 mqU8E7QGvjEaE5EHQP0WlTwqGgFWHi6gREXCSkL/AJhBjRmyIDt0CWDaYb8t1iJOLEFli+n4ywQ
 S8z3qT7cnhEmUHWYkABt4PBLyxoLv4m+gz9RXJZ8xkAWbqDiZ0AbhVM8Sv70lxEeFZDh/6LHwFq
 a6aNTmFmGZ2aUjw2Luw==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5de0d1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=9qgqu1SA9pjVKMr9YXcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: nQwyLg9HM293DAcsqkq33uMih0RYCKPZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200097

On 7/17/26 1:45 PM, Luca Weiss wrote:
> Add a node for the CPU-to-DDR BWMON on the Milos SoC and the
> corresponding OPP table.
> 
> Currently, the table is for DDR5, the values for DDR4 are put into a
> TODO comment, until the kernel can differentiate between DDR variants.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
