Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FED1A8405
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 13:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734700813; cv=none; b=WIUJFYjgtKVz3LUhwD7RXDQdg1PMtBYaYrVTqWVD+rfLUhKp8V8o7j/KcZ8h/ZZKGXA2FMv0OGTRHBovadnwJQUxZErW8KiyRA5dt3yUI2wSH7OGsWoqrVPZ0xcnoy2tEXW3+DEz7KmZEchnyW5MOPre90tVsIx/wvXyMpeZTt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734700813; c=relaxed/simple;
	bh=qSfbqqTeUsfrV921pSzv4rotULKHnoKWr6PwLctoD8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MPpkpxr0u/hJbnoAi81t6ZE7zzHYmqCzWfeyyb718DgKNHHlNgmOjc2UhiavhGh0klu+yBDm0YLH7mwgjFr1fCEYfLaaYq7/PUB9FRGKTfUpwDyB1r8g/rhtvpIacDB44rF0/TBk4gX0H2w/FZKPnk8KilpHZKXjQ9WsSfX7P1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nbPKx//V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbPKx//V"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKAKdmF003387
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 13:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3vU055oJIDpMQcbkPsF3SDZEF+lNsh9exzRg03WdMHM=; b=nbPKx//V0ggFPhqO
	qta1Sa2dKDWtrgmvCkSazJQVl9LL1kNKMzkBgAA6jRqVMopfw1EhZWUMrp4wcrxL
	sjYqgpOzwoqHL0fbXosCD9xhFRztahIQvWdRrjEKOvRPOrIu62gb3EgpeqKi/v+m
	Ze4uiZ3Oqn16BHXxeKEyD/zSqxKSv1Bzu2CFvDkglsd1UrnGIMPqclBvJXBWYKiZ
	oFbi1TLHzDj5X+/1Jj6XOBBDvvET0lnJ/l7J4OZYZKqeyn7RC9Cjg51ycNnt+VDz
	fRUeFeE5iU+ccpeZyakC9Wp7dXErNSWCxIHD5yUaAEZmD7B1fA8J9BsxnFwEG2ZQ
	oUsyFA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n6ra8dpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 13:20:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-467a437e5feso4455091cf.0
        for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 05:20:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734700808; x=1735305608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3vU055oJIDpMQcbkPsF3SDZEF+lNsh9exzRg03WdMHM=;
        b=iaahtLmqQOzhds7mTF6tibiUtgmYeOYDHoIOrw1/7t8jbLvg8P4cZSCyWqD1lD/eIp
         iv/y7js/r5B84AuS+G/xz3mK2Jw4/lQuFlVfmS8OS989YHZwHmkBOXGztm2gBT8e2U6s
         jvvo9jt8DhYTC7i0z/SX/GxKONZ0e6tdA5hySCgoYdOGxUg5Scn5lPR/2i5+XOPw6k70
         q3RIUsNjkjBP1lWy9Cjpu5zTMYajrV0tpeJyV8+eOj+A79bAo1N1fQmOjV1wXMOkR5MG
         REHobM4WXGrc20LAlCfBPwLg7vWQuZlBika9xAPcSIMhj4/KPWelj6mvaPE0rDPxe8HB
         /wBg==
X-Forwarded-Encrypted: i=1; AJvYcCV4JzhNm9sZGS/RD7n2tT60tdeXYlW2kfizS2DnLONmgf0loW25GYAy1vA0kNIGT1IlFe9cEivgjyHeSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg/R5BbcgpM+BdEHxltqOTukwaIF1GWRSeXdRdOzRiw9yiyYj9
	YKM46KrzYef9QpcmfnC9cnMROKKHnX9w8xGhapxYilG653RUc8CAOVkhUgLbtf2/L7rc75j0KAz
	ZG+NBr2SUH58XA4THTf/HRah3pl0wUweBS5hfCMbcwWc1FSJufuvnyyvAhFj+zg==
X-Gm-Gg: ASbGncuSdee7fJkORxf+0ya+Trpf0dEZCpwNMxVPfAizlnjLpiS0pXEB60tU9538MsR
	Cg3b6yIUVTQKeOaVH6v6bDdGghM3DzfzRah7V/5vW0W6aUKZfOQg0cVdRDSfkLXyyIqLKsFXe0Q
	NKbkXQjD9H/t1CSoks1MIPkqRNmyyVMnFbEJZYaThEbAgyqCnsfV2ZfG/pUHStmKz85vNEy+Vr8
	B6QNutfQgyPO+IklcFHwEF6e+26MGCErT9gzjZnpfee5JAiDzDl1LItzzgoCaTcJnIMp0uUpgnb
	0dlS8LN8GptGpBkcc5hrCvnaOxwuig8x8dc=
X-Received: by 2002:a05:622a:64d:b0:467:742e:f07e with SMTP id d75a77b69052e-46a4a8f60afmr16227981cf.7.1734700808196;
        Fri, 20 Dec 2024 05:20:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkbtzvc/Ed5Ft0Yr+bncoaYDNLU16j3bsvHg4I5KI43NWq7dEYspuWnuZKSy6DmnCGEvS7wg==
X-Received: by 2002:a05:622a:64d:b0:467:742e:f07e with SMTP id d75a77b69052e-46a4a8f60afmr16227781cf.7.1734700807708;
        Fri, 20 Dec 2024 05:20:07 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f05fd7csm175668166b.172.2024.12.20.05.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 05:20:07 -0800 (PST)
Message-ID: <fb4ddc73-545c-48b6-aefd-fdc83005ec07@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 14:20:04 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pd_mapper: Add SM7225 compatible
To: Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241220-pd-mapper-sm7225-v1-1-68f85a87288d@fairphone.com>
 <2ee51e35-da7d-42c6-a868-bd8f8700d617@oss.qualcomm.com>
 <D6GG70FQ29ZB.PEJZ4TE4HWQV@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <D6GG70FQ29ZB.PEJZ4TE4HWQV@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: F1j-4CVzIo8ytQKnzvR5QOK5LpdYDNob
X-Proofpoint-ORIG-GUID: F1j-4CVzIo8ytQKnzvR5QOK5LpdYDNob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200110

On 20.12.2024 11:15 AM, Luca Weiss wrote:
> On Fri Dec 20, 2024 at 10:39 AM CET, Konrad Dybcio wrote:
>> On 20.12.2024 9:39 AM, Luca Weiss wrote:
>>> The Qualcomm SM7225 is practically identical to SM6350, so add an entry
>>> using that data.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>
>> I think we should instead add the fallback compatible, like
>>
>> - enum:
>>       - asdf,asdf
>> - const: qcom,sm7225
>> - const: qcom,sm6350
>>
>> as we've done for speedbin/rename variants of SoCs lately, with separate
>> entries being added for "actually different" sillicon.
> 
> We also have currently for example sm7325=sc7280=qcm6490, would that
> fall into this category as well for you, or are they more different?
> 
> But do you think it's worth trying to also change existing platforms
> like that? We also have basically the same list in
> drivers/cpufreq/cpufreq-dt-platdev.c where we have both sm6350 and
> sm7225 right now.

Hm, with existing boards, I guess that's a question for dt-bindings folks

Konrad
