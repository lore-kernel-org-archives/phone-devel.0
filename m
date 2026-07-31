Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECAC44D01C
	for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 16:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785516150; cv=none; b=eaG6XgTJzJSq6Tdl7zf+7WQ4WkBKfB595Lhir+mgFhRuRXCg9bmeXGnRsZ1pgIramJm/sJ5H4XbixtCpDmDmpvmjLeqcCsTBZhu8yuKy2/YE4j5/XldzF0rcf32+VQ34tqpXKoqMnGzZN7btvRY/tOfyTJ9NmyTC6lOgxSi5y+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785516150; c=relaxed/simple;
	bh=j7oNLmRGMB7G6Bknh5UBWwNbKEi6AzTwDDWtWUuYDxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsAoY8QaHw7baeONmLWBJU9jI7ZnNPh3HHr/hnJHwZ2m5Mrpc7l53rFgvrFb0A2io7OOrRtyjYd0SgJ5wk+ABT0K8eXf7+LYMnCCKcY/DiLI7LCmWSjkNXk/pch1IPz1OTaAjCe4/d8WQ+Vdku3gDyr+z9dmmSMLdieV/7Hc4Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iWyCUDqU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCJM5n8v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iWyCUDqU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCJM5n8v"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFP8Oe108902
	for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 16:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2kl7Z2qOkmquPX69ck+O7i+EQ9JO4vg6bvwMuEcRZXs=; b=iWyCUDqUGRxgqRqB
	soyngGkJSiQdGpu7AqErmbaNNBcysw/bB6MLShY5bKTqsU4cEkZR16GXkC9sOBOK
	fTVxHO0YQ05ExrdftiLGafcaG8ofrf8vS0hGXnCGkLy3e8/DT7H/8P3ynwusJ5VX
	pnnZEKP+dxa5ThpnBSgXesrd25bhil7S83jeSRV6ro8sm9LqSRoEeevJHNPaS4CG
	Vd7GQMzdtyrxWneanaGXQiXxhzoz16KoZVqLj/6qTW08HsH3ijAYI0pbs+MjlV32
	llmGHJqllwbudh3j6591IpekHR0UXi6hByKzjE8Gc3Eq4FXJbIxTiwMgI59UAihG
	k9Vv7Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru2u19df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 16:42:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfd1772d8so2037271cf.1
        for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 09:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785516145; x=1786120945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2kl7Z2qOkmquPX69ck+O7i+EQ9JO4vg6bvwMuEcRZXs=;
        b=bCJM5n8vUyZY0re/wU4C0VMQ2yv7NSP1JflTB2IC9IL0SyrWFpcxHiEBUbkZ8TD1m9
         KIIobzHzovqpJNsoCYWQ+mEk7nlQuN5qkB479GglwZylRFEETE1vehv2nlkU6n6yw1EV
         FxT8J3zqqNz2gtJMsmSVnHDyPOl/aG5Nwl7ncveZlkBqVH07V/GvROXGEIz30ItHae5J
         OaFtZxsALia2hnjOUQ0uq7nj2H9tqJtzjfM56KuEvlyA5fwcPw6L4HeLSdmE17PnYS33
         1jU/cOXLtGMDiGb8cJRJbFHv/1obIELzkmCIx31DaBRsdhIFln5Lpb6dq9Qz3emfL1Zj
         KNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785516145; x=1786120945;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kl7Z2qOkmquPX69ck+O7i+EQ9JO4vg6bvwMuEcRZXs=;
        b=ImQrwLwwvVS23KXpgvGpS4WcYWe+flT9wm2h0IzMyBSiykGp89jeVbsfCLIQTsfP3X
         nKRXbImv3bR3jqJhZ3Lw3vWtI+4dODQKOomnEeCKO+8EilcUa+fEcetyeCT4Snu4xDuy
         C7BvApD134p8CZUJ9rz1hi3KYYYTliiLgYhvdpn6Uvwq5XOn6dJgmfT0Nme7S88RVBj2
         TnbbSLvXwkpyi019FSDWJAjXiZtJyIj1OSsVeVoVok2Q+L+CdEkEQdPUIqw2hoNnVhNo
         AaCtrYhmX8Z0t3VrZs82ya2RpcivdjZt3pMlmo9Lcz0wb+SRSq1Jj0XgbaaSUWL37yeY
         dkRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqAcEJifXjW/xFfIA2ptWZIX34Xm/4FI+gVNC9hAjbv5m5kZxBk8TtWFtIs2KDmYp8ffA5kokPCAXzgyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2S7VOvdq44u9DxMhkAVcxmmA6Dzz/BsNAsv6YyIa+K/QUwCTM
	0+KBQCm4DHgwCAuLAp6iPSHkW53eeY/RvnVz6ReGJOffaeg97qx7Bp5wd4HmSq6HCFPBJJSz1Zl
	PU5DxwFzolw41QDt38GpbkwVM0pOHYupege77ROSTDq1B43FpL999tOlFioCnH81D4A==
X-Gm-Gg: AR+sD13SOZu3X60qjwtpbvLW5K7SH2l6kIFz8kxHe+cg7kM7Zu8mEVIESFV0ctr/TQd
	JEoGm/ELjP842Tw38Qqx2J4I0a9qKwUciQNNi2F8PxfcUo4YTtVF8jhrKfmp1ZbnawBiT6SDLbB
	t0Q6ZTOpdEOrNeeDhK5C6XA8/tYcb0nRh7zA8E8fVAS0GJRuoXwNZk0laZ38B0wyfK93AzInYDO
	umPmPMwhnLbpWiypmfiWqDF3x1Gu4iCpMJhlxsljNhWqcCSK1WMtdHzMsvMqV42huhMgGBmoOAl
	74Nunyx/B6LzSWp+yjat0fcmN0tfMlS0zg8YTPPs0tyAOUL3UaNKxUbHc186JpcZCvgYtixdEQI
	I0jbzDOcMbS3pbuL+JkVVUSdh
X-Received: by 2002:a05:622a:aa42:20b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52b56737710mr9634191cf.2.1785516145135;
        Fri, 31 Jul 2026 09:42:25 -0700 (PDT)
X-Received: by 2002:a05:622a:aa42:20b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52b56737710mr9633851cf.2.1785516144687;
        Fri, 31 Jul 2026 09:42:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd450d731sm218741466b.47.2026.07.31.09.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 09:42:23 -0700 (PDT)
Message-ID: <b300cfc5-b6be-4227-905d-d69200fcf857@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 18:42:21 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 compatible string for SM8475
To: Esteban Urrutia <esteuwu@proton.me>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260731-sm8475-pmic-glink-v2-0-28c04928ef22@proton.me>
 <20260731-sm8475-pmic-glink-v2-1-28c04928ef22@proton.me>
 <20260731-savvy-piquant-chowchow-f516f2@quoll>
 <9718d7b8-7303-47a2-9d75-58bbde6385e9@proton.me>
 <c4ceda32-d4c8-4fd9-b0d6-3f4519485bde@oss.qualcomm.com>
 <6fc5165c-95b5-475a-a0a6-e1d7b9721222@proton.me>
 <2ace2703-79cb-4046-a2b3-8fdeb9b2c99e@oss.qualcomm.com>
 <f3324409-8e07-478b-a0e3-da5b41d31e7c@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f3324409-8e07-478b-a0e3-da5b41d31e7c@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Dyc9iYQwAusIX8xNdp1MgiHyvDdm6DHy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyNyBTYWx0ZWRfX9tzAQM75Tumw
 lkHn99neBrHbWLZlqctic9bw5RY0uUXpxsVaYSicmAEUmgOBB0ZZsQ/2d8VnZtMzBMG004ea265
 LHeTPrAQeBnElZqhiIVPvi/U/DecNW5T82PhT4OmGsUvdQ8o7rRbwPw9OkxEwPv02cI33d3VxNk
 Lq6yGxCC8enrH/iZVUDChBuC50+AejRJ6sY/lZzpEmpFxJzU+yQd21OXIMIc/dr3fdsIcGf9DF7
 EV8a2ISyPNoSStudicRZ/Z6L9o/kvu9TaTBWIRM0I2oiz1PsCEO4bMpTR8jqtfMbrp8gJKuje0u
 5Dcdq8OeWzC1Zd0FFK16oHfqjmx/KMG3bCrKClwqJLvsgql9Jm30yfajp8UArpDAqNNQII/NWfE
 jJsUymSIv5iwOOmhK8KN065dPt4ew35X5Jhbz7TLfbFvRX6PVHNcQEN/yPV9JCjRuVSw4eb2be+
 dG5wKs8E0kxIwUoaQIQ==
X-Proofpoint-GUID: Dyc9iYQwAusIX8xNdp1MgiHyvDdm6DHy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyNyBTYWx0ZWRfX0XIdHFSfSmi+
 R7KbIn38ytDO3kjW5UIlsYoBEPKCifzpTl+p8MAYGt3SUUbyYkV0OxmOytT4Njh/4MhfDTQdIVT
 A9opvK1iXDxU4dtPlcwP+tStg0e1uds=
X-Authority-Analysis: v=2.4 cv=b+uCJNGx c=1 sm=1 tr=0 ts=6a6cd072 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=x51eZAOGJv5k9Dsnt6IA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310127

On 7/31/26 6:40 PM, Esteban Urrutia wrote:
> On 7/31/26 12:28 PM, Konrad Dybcio wrote:
>> Somehow I confabulated the generic compatible being present in the
>> driver... I was trying to explain that
>>
>> And yes I didn't notice the 8350/8450 difference. But anyway, the
>> resolution will be one of:
>>
>> // 8450 is fully compatible
>> "qcom,sm8475-pmic-glink",
>> "qcom,sm8450-pmic-glink",
>> "qcom,pmic-glink"
>>
>> or
>>
>> // 8475 is special
>> "qcom,sm8475-pmic-glink",
>> "qcom,pmic-glink"
>>
>> depending on what you believe is more correct. I think the first
>> one fits better.
> 
> Yes, I agree the first case fits better, but I believe there is also a
> possible third case:
> 
> // 8550 is fully compatible
> "qcom,sm8475-pmic-glink",
> "qcom,sm8550-pmic-glink",
> "qcom,pmic-glink"
> 
> The reason why I believe this is that I've found SM8475 to include some
> elements such as eUSB or PHY sequences found in more recent SoCs such as
> SM8550.
> I guess that's the case since SM8475 is a respin, but I'm not sure.

pmic-glink provides three main services:

- UCSI (Type-C)
- altmode pin assignment notifications (also Type-C)
- battmgr (battery/power supply)

In that scope, I believe it's no different to 8450

Konrad
