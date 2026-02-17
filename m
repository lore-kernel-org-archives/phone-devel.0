Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E9621E087
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 22:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771366689; cv=none; b=okpEo5LEYTx7uoX21YPpsOjCIjtzJAxn0etUx7njLVjVxFYjjxbX6vmpvJrZVFy9bbGR9rYZ8bEpbruAufhI0+GicxoqEekVIy65JseFTOLQYfP1tRWcKFMpJpa4kwW0Fq58YE2IGudIIaBAxd0NSSbpqZVFMZxaY1937PjUoCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771366689; c=relaxed/simple;
	bh=SXpSx7WMHtVORUj1JyaFxGtu4f7dFLYpyqZ0r7psjnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lhVexYGB/8CdQ2L7uhzL7pw/f3hpKSK+3EGwTzA155h9C2V1y1CRCKCH1LZsnAmj6GixxWmoPD5ZudLgljG+dPFpUyJRkEaKzkQlz0+9jA1Hd5KynIjDhYo07G2r6NDT/tJs9a7EhAkXamRTlCNjXNxDS7mdOUdu4K8qJ88zZiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mU0BSUwY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XngxxOjx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mU0BSUwY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XngxxOjx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HG2lON297219
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 22:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zJ71lGN85nLguALAwGHbmGb7XD2DILMpKE2Y/7toqk=; b=mU0BSUwYV6csZlT9
	Phg/pYNy+yMBpy8t60tP/Cle4dGUtgSJsv+eivoeYj9d0qZF5BeXwwPbwGmoTv3r
	GDmqltCdSBiVBoHxIGWonm1Snxi2SUJvEYPgGWm0i1dLZnxRs6GDjtnlHbe6djr4
	Ni/GNUyv3rDQa979YxZgexxglatJQcAfCt5DQzeJvSGnck3XPKOI4VDFS7DUIZn5
	sTxOK3pnomqIGOLCmj3k2/336I3AuZHvoE4ZvAdUcMoDpbAhP+ONEtlG2j5Ba0DP
	oupAD2s9iH7kR+hnKtPUXsd8U+C+4ZkWngdft/TTtB4M1TlNksJ4yVgYzNCxzxhe
	iGvA6w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9v7sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 22:18:07 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12721cd1a2aso11831234c88.1
        for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 14:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771366686; x=1771971486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0zJ71lGN85nLguALAwGHbmGb7XD2DILMpKE2Y/7toqk=;
        b=XngxxOjxR9bQanTuo6o3MqoW8AFvW30FAuzWph4c/2KwegWaFYvU7nH7Io6u1RfDq9
         ytpmWxJXrO8X56zbsbKQD30sJCI/Ha3wj6S1wC595vJvXAGALn8QYzFK2SghnYGi7c3N
         48xm8OOVVS74KNenaR3Y6bYW+zM0VXLyQq1P+YRRpbZX5GG4yOXwns2n70O8trPF22nZ
         fZJw0tc1UKU88wCstQc1zEfT1s5RiER522ljS+6tfgWred7CKaci4vR2sV5yZ3DWVlCQ
         AXiWdTwiRGzvKErwcP57GO0OLy50aT+ylcg/4IvcsxyqBMRnR8HOlKCPv21TMKdGmzq9
         tOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771366686; x=1771971486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zJ71lGN85nLguALAwGHbmGb7XD2DILMpKE2Y/7toqk=;
        b=dUkJ04R5fg26IX/jtKq7OtoQZP5H3MWgnN1XR06rgpp+tLH1IqU/iyae/2QTJK7Ci8
         vztpPCrsv6r+3aG8DRJhvxmhQwhziZMb37NAcYmyDmZZ7GDqCOYLrG1Dl63X8bEU0ed/
         I5kQCczIG5tyiNXNEE+tfakjkX15gj4EOz+q6KkGFKjXE8l2N6VqO8fMb2xAkf3yrkKd
         p2elQKs+8Pvr1GRUDrkeSYr6q/8TZhBSuDkLuGwANjYSgNiaUeCyUV8rA1hLDHunTT2X
         pq/VT7GXzGJdNVEp6DGEhbyMtys63jdLZN6enhHeTFwhcB+Y1TVVtRF+lXDAOgO9lVis
         8fIg==
X-Forwarded-Encrypted: i=1; AJvYcCWKpiLJwbbXHgPmGJW+qFLhJnJNVErbiG+/A8vvd7d+DkEr+D2X54Yr2PRlXP/WPf+zYPexDurk06nyBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5uURThMcFTAg+BbII7Z75nunO2TLWYUDqfj1/F4rq5RrWd5Ly
	tfYFcjGV0SHbTT9vj87/puec0bBzAo3h0I+yWFBqsXeR/KdNfrj1sF6AhUlORXxLkDd0X0tcJxj
	IxSh3BE4LSHkUHE9tbJi7qvFdwXKZD2fwwVF8jFU8bsEoWRpbchG4sXHJZYE5YbK/MA==
X-Gm-Gg: AZuq6aJNxUmw5BVY4ZGKYqPiERasVV4s4ShRh7YSQ8G5XmdTl0BXqUk95uUruITdpKd
	GS1QlhK54qy36ypOJjLmA2s7a3Ye1zp25xkeC54V74MvI3C3wjK2zNxcRlJkvQDLYYB5f1m1dTi
	ED/wddKVJRnVXZlLy83Hx4M1TNXurY0103YUNgqdkTuyDtTgtTBHvGwYScu39Rlr+f+C8lnojqz
	rwgZVfYM721v1mGp8Afba01oUN2diVhQdJqPP4PbY0zdcuPMu00Du6L3KqZYXsbrAFeL5ojxTf3
	H/yGYNl2jFwuQhVyaYcwb3A8NyUd6vjYiT9fD3BCzIKmVCAQnmL0Frj38BhwhFTXF07GItaZzI5
	2IoMxDK5bFndW2e7Uhlk5sIppkegvYtG7jCou1fb2QTjH1usNWtXe/lmc16/RLMN2Ei9HWwI3aL
	ckVw==
X-Received: by 2002:a05:7022:a91:b0:119:e56b:c75c with SMTP id a92af1059eb24-1273ae80e60mr8137340c88.33.1771366686315;
        Tue, 17 Feb 2026 14:18:06 -0800 (PST)
X-Received: by 2002:a05:7022:a91:b0:119:e56b:c75c with SMTP id a92af1059eb24-1273ae80e60mr8137311c88.33.1771366685754;
        Tue, 17 Feb 2026 14:18:05 -0800 (PST)
Received: from [10.62.37.112] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c6430asm17279170c88.6.2026.02.17.14.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 14:18:05 -0800 (PST)
Message-ID: <b3e76e9f-a820-43ee-9089-7b7eaa876ebe@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 14:18:04 -0800
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Bryan O'Donoghue <bod@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
 <20260213-sm6350-camss-v3-1-30a845b0b7cc@fairphone.com>
 <W3evhxwcLQLbkKftGpGmJ5LaEO_h3nxsWSSzrthlfatPfO60KrPpbyaq7yAu1vKbQc0RLqsaCQhTPzRruNTg_Q==@protonmail.internalid>
 <20260214-slick-ringtail-of-innovation-d8eecd@quoll>
 <f5869002-1b42-4164-9f14-2ee41f5b1496@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <f5869002-1b42-4164-9f14-2ee41f5b1496@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE4NCBTYWx0ZWRfXxXeMiDgOVIeQ
 i9SY7DabfWe/jiKWwZg40C0e7Xv6YXorjJCsALnZ6VG1bZ4835g7kzrLMiHWPFETKk6f6vrANjQ
 O/rPUP1IAozSfmmD40tI1kL+LMhXk4pelCxFsqWpuFI8lOBvqgeKYDOh0agMKEHhuMJ5Ps2oSUW
 nYwx+jae3Gs6FvY0qxMtQWrFzgOX5o+XZuOVTJ67k8SwEE73JWNXLryeaNxQNtqdoS3IRbwdSEt
 q6aEnLkmAAa0RmF/9ATHClu+RqpWufcs1a6oMCFwuO9pCLD7LH9v1xAmJo12EyejLCZlQCaHbyO
 SHNwCqY2VnA6YWfcLEGtAH/h1t5kDqQW/9ynqEm0Lv8SG6eTxYj0JGdad5pJ0q23/BbElOPRuNw
 bW+sw10CEkFwcJHRlDNEfEtdamH6GqJsVLdFukfOfuaXEc0WlUID6+mSPVo2M9zbWAf04Ru+Ti1
 gEepoBYGnz/WtWB9lwA==
X-Proofpoint-GUID: dgX8XbBc8QXWzIfSIKA23aXcY5D-nW2i
X-Proofpoint-ORIG-GUID: dgX8XbBc8QXWzIfSIKA23aXcY5D-nW2i
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=6994e91f cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uS_WSclN8nCJ1qZK6-wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170184



On 2/14/2026 5:05 AM, Bryan O'Donoghue wrote:
> On 14/02/2026 08:37, Krzysztof Kozlowski wrote:
>> On Fri, Feb 13, 2026 at 02:15:01PM +0100, Luca Weiss wrote:
>>> +  power-domains:
>>> +    maxItems: 6
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: bps
>>> +      - const: ife0
>>> +      - const: ife1
>>
>> ife0, ife1, ife2, top, bps, ipe like in sm6150 or sm8650.
>>
>>> +      - const: ife2
>>> +      - const: ipe
>>> +      - const: top
>>> +
>>> +  vdd-csiphy0-0p9-supply:
>>> +    description:
>>> +      Phandle to a 0.9V regulator supply to CSIPHY0.
>>> +
>>> +  vdd-csiphy0-1p25-supply:
>>> +    description:
>>> +      Phandle to a 1.25V regulator supply to CSIPHY0.
>>> +
>>> +  vdd-csiphy1-0p9-supply:
>>> +    description:
>>> +      Phandle to a 0.9V regulator supply to CSIPHY1.
>>> +
>>> +  vdd-csiphy1-1p25-supply:
>>> +    description:
>>> +      Phandle to a 1.25V regulator supply to CSIPHY1.
>>> +
>>> +  vdd-csiphy2-0p9-supply:
>>> +    description:
>>> +      Phandle to a 0.9V regulator supply to CSIPHY2.
>>> +
>>> +  vdd-csiphy2-1p25-supply:
>>> +    description:
>>> +      Phandle to a 1.25V regulator supply to CSIPHY2.
>>> +
>>> +  vdd-csiphy3-0p9-supply:
>>> +    description:
>>> +      Phandle to a 0.9V regulator supply to CSIPHY3.
>>> +
>>> +  vdd-csiphy3-1p25-supply:
>>> +    description:
>>> +      Phandle to a 1.25V regulator supply to CSIPHY3.
>>
>> I assume that we abandon the idea of separate CSI PHY devices. It was
>> discssed way too long time ago.
> 
> No just waiting for 6.20/7.0 to drop however, I think its fine to add 
> new definitions until we merge that series.
>> With domains changed:
Please correct me if I misunderstood but if we are not blocking the new 
patches over PHY node separation anymore, can you re-review SM8750 
patches please, Krzysztof? Thank you.

https://lore.kernel.org/all/20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com/
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> Best regards,
>> Krzysztof
>>
> 
> 
> 

