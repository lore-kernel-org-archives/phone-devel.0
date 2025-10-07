Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178F81DF99A
	for <phone-devel@vger.kernel.org>; Tue,  7 Oct 2025 13:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759844794; cv=none; b=QWvSuw50/GUsZHLitZMdH2KqKGSS8Kp2m3vVd2A0ybd9OeAEVS8LIEUXdADW0047fUJ8D7adV8VD9QzGMD58sckp3kOV5KEhqWOqaQEC5f8FttzdSKUlSqG5FfgHc1yjUPFQZIHEHSrS5nb8wpiZrtgwksoQZ5aYSVp2k01e0xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759844794; c=relaxed/simple;
	bh=3lZ6UknrUZZp3tKa2loAmoYm234VuiXYoihS9yGbQBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tvhUQPlIIDWdF4O1s/37AtzWCjJz8L1dAcZZkKYMoPwNNXwXytIKd2kebwMOPWwLvGvVNODUvCYwi+b/1HK1HGOesYob26Tyv6GeyNOWFvnpB8Qadw7k3+lUQ5ozE3X37OypNVBfavwsGk9Klot8Mme3iJ4ns8FSlwDB8/a9w5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9JgE6P4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9JgE6P4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5977hiKa020044
	for <phone-devel@vger.kernel.org>; Tue, 7 Oct 2025 13:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s7CUkY7mH78KwOEvSRjDxBNTwXfK/qejz2A+Lc8hlKo=; b=I9JgE6P4BzU9cS2i
	aYUkLxuo2pVVtSjvX/uBAUJoO3l07Cif096zbdf62t9OiJl805yT8K2KEiLzcB3d
	XVpSTiPDwANk/R5jCW8TRVxQftnWqvtx1PYNxiQCQoF4HnaVBnPCl0m5Qiz1JCfk
	zp8WmBflyOFFUwO4f5OYJya9KMI82++I3Be8ZWeM0GrkCYOKc4plAl3rwAZnMxA6
	MxVde2/LDqxtUpEL4BdEDf2zbJgchtio9PheWNZT48E/jTODUrx877oEEFrgss0G
	sT53XGKGkblwlGvFCKOm9qCBkSyO4VsHF4YLyuYkfVkDLAgucDCBBjANzqReydPo
	+8vPYA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkpt71e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Oct 2025 13:46:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e56b12ea56so12295791cf.2
        for <phone-devel@vger.kernel.org>; Tue, 07 Oct 2025 06:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759844790; x=1760449590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s7CUkY7mH78KwOEvSRjDxBNTwXfK/qejz2A+Lc8hlKo=;
        b=rWInCwbVUKlBb7EKBP1wAjkaO84YUFX7zVNnDN7dnLGD9QlNnexVI0cwqvrc1mYhR5
         iO9GfO39RjSJquhs22jHLyYd0fKC8+MbPK2vDsD6/3FIlr6j0Pj+pw7kqX/KfsWc1hSx
         zI+muUrsbG5NAbc1eEIqyCXqHI+39txEbN2V2txFaFhPQuQ/ixQ3Wh6U2mg79YG/zBGx
         FZnsV8pqQBWJHLifp2HbOJa3DWqiv/zUb2/tlMGkVgMUskOTzN+D+PtmfwcBWw5hErjf
         to76amMvV1uusM5abEFRCcjmkmLGxjfy1c+4KAtHFI98DXxw92dswNpFl/5T7FLd87lh
         28WA==
X-Forwarded-Encrypted: i=1; AJvYcCVOfJzLwW24Jte4GPJvjyarKBKEkrFEy7Usu90MOJ6e2+j+kmRKuggG9auu+PYRhM7ew0czaq8h1CfniA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+i/ohIZiVJ32fUs2mjzff/zgabScEowBPrNZ0GuboKHitpIxZ
	GjBYP+nD4kxv2Tu56j3isfE/JA4y4045YjfBcamjIWVrlkkidjX1jGZQ1Obr9yF53/I38JlxUfj
	wQ3luIkGfftdg4XM7rWkWvEJqYHD02t3/L9+xYRkXU8b4KsLyZJoLWMXzGd099aAXeQ==
X-Gm-Gg: ASbGncuG1V9RdoYChsNH9MNYOurGszZbfRMKugO/mgy969YvUFnc+1/LlEPT12WnZZj
	tMH7krayOpXI1zJ/dWzi9V0S0k/driApHI9MTGAgn+gD74XdYaJ9nP79Nm0bCe/id/I3SCTWv+o
	VwYMjtAbRT6HntQ7PnMRjkuvdVPTbBSlJH6zDxHf5EZ+dEOAdAz4Smo2+6w/Q8gZxpD4HvHr31y
	n95hH4jF2WuqCZVkXhqLaKIIrD6ysG9Rn7KWNh+lInpn15Ict9iiGIIZfLMNkV9jf/Oi5B6ILsx
	adI+fJk5A37TOx6fznOo0r0urFTw/8P5dTKx5YObp+8F96x+cvyMuww2lh0uSzIcSAXmNb6UeeB
	mD7JU/tLif+oG32HuH0d7C/ZnqKw=
X-Received: by 2002:a05:622a:4f8a:b0:4c7:e39a:38a6 with SMTP id d75a77b69052e-4e576a2e65bmr125015671cf.2.1759844790325;
        Tue, 07 Oct 2025 06:46:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMMuzgbdK3DGk8z54m0Z+WLLqxl6a+HKbK9xOp9p+K9sQwGuQ9spnb3O8fDu1XDavgAEg67g==
X-Received: by 2002:a05:622a:4f8a:b0:4c7:e39a:38a6 with SMTP id d75a77b69052e-4e576a2e65bmr125015241cf.2.1759844789676;
        Tue, 07 Oct 2025 06:46:29 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9ff0sm1396244066b.5.2025.10.07.06.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 06:46:29 -0700 (PDT)
Message-ID: <a349dcce-030b-47f5-9644-047e5b060cfe@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 15:46:26 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8939: Add camss and cci
To: git@apitzsch.eu, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vincent Knecht <vincent.knecht@mailoo.org>
References: <20250908-camss-8x39-vbif-v1-0-f198c9fd0d4d@apitzsch.eu>
 <20250908-camss-8x39-vbif-v1-4-f198c9fd0d4d@apitzsch.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908-camss-8x39-vbif-v1-4-f198c9fd0d4d@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jriHWygDLpH7G7NK3zjf2Z-U2M2X9IdJ
X-Proofpoint-ORIG-GUID: jriHWygDLpH7G7NK3zjf2Z-U2M2X9IdJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfX06BqFIFyKVIn
 eDgjeHzFdNWGuCNE9isNfRzBic9NJn/unFaZ6isvrGo9y31E14VA+dTEzdStUi2eqEtKo4aB6iY
 E2JWFv96cb6XuNgO9AZ+v4igutrp0KXWPo7fyvKknOa/OieBi2yWwD2mSwM5SCXQSbmCXAdbll+
 3q0MqDE5zzHbIZGhlGVTWv4C9qZL5TQibW4e0clViaINgosxRCbufBGI1Za/gXe5aWMsgq+HgyE
 jWglh/nIe1pIWd57u0bnEeX8kJjKZRWNgi6ASF9sKWbDXwoDahVRsCFdtaz7ppRJAY17KDmQmgM
 PTFBTSmMTqmeRgvum6TWw5Z62JOrEFkBoXwBGmjfHVbnuM46tmIlryMj+65wXh7lzfnxM2NfXzR
 MvigbFChj7x2qR01qgHzOtRQDWPNWw==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e519b7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=TqukyxIwAAAA:8 a=HDjIzE35AAAA:8
 a=EUspDBNiAAAA:8 a=PM9i-VSbYM6VvaBKnRMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=e_wvXvRcY2B3oMitRgDS:22 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168

On 9/8/25 12:04 AM, André Apitzsch via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 615.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> [André: Make order of items the same as in 8916]
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
