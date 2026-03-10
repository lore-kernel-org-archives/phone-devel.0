Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CDC3AB26E
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 13:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147885; cv=none; b=qY1tPd1RAa82fdKowi0B23wN+F8hb8pr7fRy+E0Wx6GDKIf0xA40INBYbeXYARBBqn5Onw1w6/XRfVzaB+2xJo1gfdTZBm8Gs+/J+jMBZIVmdvY8oJRZXCaK9MOV/cCl/rSGiFizbnPcTgbsFUiWgHLNrDc7A1/BnW6r3yWVz0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147885; c=relaxed/simple;
	bh=PqDEdtJr5rYsWHIKMkdODRmDFBiKW6a54M5VEG7hS5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UTjarf5fJtNZx5s00fRJQnA6aiHUeFCkfVNMCKdUT/Cdp1NkN6t3q8M7k5S9QojDljRyAi0J40ZKXIKW/VIdjWQal7q8eBRsOA5CdQNw0LP4m8UkxwEqXxWghktcWHL5jDMbPAwPszmA5iJOmJ2blMrnTOlAOhe/gXQ2wA4UROo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i5+iey4s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Key4mE1y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5+iey4s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Key4mE1y"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaXXi1502977
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 13:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PqDEdtJr5rYsWHIKMkdODRmDFBiKW6a54M5VEG7hS5I=; b=i5+iey4sqaTlfIf0
	s3jxouP6fCG/yWIcXY3qQ4NIID3wIziolCIv/5pMeJ+HGhwy6hGeqyNRJBOd0/bh
	+EMOd4MN+T9JdFb/8rX0xiAiqk8+bLwJzN3B3vUl0Nef7YiPQ5b/kaSPeG6lO3lR
	8AVTUrngZk7OyFVJnvJZGmRGetSObMETuJJuYUFeS1VzSIYz/e10J9zUffw1CYIu
	joUAmNtRqiyl6OK9DRmfha0XEBJ9LuFP1DmGlICTs3uVmeuRikfYeieC6WolomUA
	lfAN0TsQZpZfqVd4FBrSUm3gugI0GtsScu7pObSA589ycACjLULtynKEbkPwAMLc
	pTmYog==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8hjy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 13:04:43 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ff04e26bd9so196489137.0
        for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 06:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773147883; x=1773752683; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PqDEdtJr5rYsWHIKMkdODRmDFBiKW6a54M5VEG7hS5I=;
        b=Key4mE1yE6XuPjmOFG6yZlYQseLX6AO8QbQzzy1EvbpsBOcgxEQp4l8nxV5JijKHI6
         JYiBZEL4DepquqMrux9MhWl1o0SmblODPo67Si5bBOz9agOL0+NPXnakaHgGrg3L7hn4
         JCmY38tUe0g+CQGVQmBbBW8lvaV5p17FybUa/0e+2YhlekKBdjNuQDrQDpjR13ixU1jK
         rGR5oqXB0qcYZLdl0OJuP4csg8iQxNrdpUDuGjSr9eYFJEXNgiDLMS6TV8TfUIfL1URV
         9HhRdpPzKlHW0yDUKLB6ZmMUQTvlE1D/KjYsEpgU9OxRa4+WE1NsuAmm2Pf+yszedRu8
         VKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147883; x=1773752683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PqDEdtJr5rYsWHIKMkdODRmDFBiKW6a54M5VEG7hS5I=;
        b=laqmamlO6bhhKT9B2ksBZXYc749tN4CGVUdgEtBRcrHF/guYPAYI3fe3n96LPtOobW
         i1iUZDt+gD6JKWgc/EfQTvAGig5gYetxxXvyWybvAniHKajkgHaAnsVwfbCsiA//vENb
         J3vNPNYTN9aP0Pu1tzcOboey0DaBBybara8S0ICxbc9jfrVzkjx1aFvnZTXDbTJw0zlP
         0XpkUrCNn9G96bpsgNosIkkOhJo5IZgh+/Xs0HpzaAYgIW9onUxkmSSff9enH8NcqQny
         xQK8TLPaUNhmoTdThWdhwmFbsrzNpG1YWbGyCwjEu42ZeGCHrCJe7/kws6B+2QqpbPKv
         3+uA==
X-Forwarded-Encrypted: i=1; AJvYcCW/GOWbwAP/GQBimWYTegTOBzE77WfHfLbQMskuH+MpMk4+C8g/Q54ODSaWuKFbiDoExAVV8I+xf0YD/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2rHqDxemCCB+S7MMxVjuMZvpZQtjRuN9csiLz1puwMonTJ1AB
	SePpLm6Ds00siBV4N8MzCAiaGZ22Z6K3Tuc9hqyTk0pzV+t2nCP95Ju7kYaFhytRCT5xCAGvtEC
	IjLTvLTOWKSnDjAve5tUvUxGN5RGxIDpteMVtr3IW8bBvVhk3hS1F8Nm4kg1rcE0jWw==
X-Gm-Gg: ATEYQzyUaNiUt81YUa1WPiGsaJtLcmVu2a/MqYXOko1EGRBpJ83Ql2EaoAdN1flUIXZ
	h57Beo2ZpWmxrMi+8hjRyfV6APWMR4v21wzdKEeW+XN4fLWTszehl61wz5xpzp83O8cc6YdsKPV
	h9pq7nnOzHj7Mn9niXs4bDXAYHY5F0GQ4Bb7eW0K3oB8xxXNA1MjcWMb6HGa7nI/3aNxM9NIIml
	Hf0UKYpyZi76a641GBwj93CsWpIbilti4sUKTpo0BNhGRBBYwKUXsB4SmX2GPt1+G2eFZBM3sGG
	8xwus0+CL2wQ6/TeRQx4uXpdN20daI1bTAtNAoYg3uV42jJ9euO6Zc2LhMrF++oo5nrj1V9sKp9
	xEU+zn9hf7IgFAo01RDBKra0cedeOgXBVZUhN0iHTNtQlrQdlHKThdYEUyyGaDzTuSiFaYDE9ei
	OLlqw=
X-Received: by 2002:a05:6102:c8f:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-5ffe6125078mr2738590137.3.1773147882062;
        Tue, 10 Mar 2026 06:04:42 -0700 (PDT)
X-Received: by 2002:a05:6102:c8f:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-5ffe6125078mr2738573137.3.1773147881617;
        Tue, 10 Mar 2026 06:04:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6629f7cbc78sm1437909a12.17.2026.03.10.06.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:04:40 -0700 (PDT)
Message-ID: <2255b753-4d40-4e49-a89c-22ee939c51d1@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:04:37 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8917-xiaomi-riva: Commonize for
 Redmi 4A and GO
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        phone-devel@vger.kernel.org
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-1-436f1f4b7399@mainlining.org>
 <ab66ac70-9c63-4dbc-9ec4-8dc5344fb045@oss.qualcomm.com>
 <fabedbb450f409aa0aa415151de0263b@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fabedbb450f409aa0aa415151de0263b@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNCBTYWx0ZWRfX+5L/AUykeWpa
 Fmu6UGGX1ZMVayqc6JPOtP1PP2WltBaTtASelbxMHaWfNDz46CtT2PDXgrKQ7XTmt5wvePI8GP4
 vkgwwa4spf/cYlm9lFjI1F6mc/sCcEAXcCIZFGeFYQkZFCA7rX137NQ9wtRhPAIAL1mePRzYLoA
 dduPoEduzFJz3NYbWtVbZeKkQrotRz6dwVbKcS8WnnoYEHF5PCDBGChnNNacm9prYiVEkYhR3Am
 0f5YUV8WZlgAlAutO5xfZjkMC+w4VO7jJdffLMQ0N6aBmJUOq7wKk2E9TrsW6+1db0q4lgsVnGV
 R6BJIK24FiHHmbkh5BT+rODJl064uOPnhTkefRL052JJTRHljczUHvXTDJkQC9wJhXG3YvUqaS3
 l/+vyuWs/HkxvhpRSEEAkuHjKNgCy7QLyyzgN/mUyWFiqbemJNH7h1g+UzkcE5Tz5WVL9riK3GG
 HG8p1r95sUNO69vIUBA==
X-Proofpoint-ORIG-GUID: OlQwJp7Td9dK7-MRcM1nB6vQuy6ddHKd
X-Proofpoint-GUID: OlQwJp7Td9dK7-MRcM1nB6vQuy6ddHKd
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69b016eb cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OuZLqq7tAAAA:8 a=xHgDL4wFP_-0hZMmzhMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=-aSRE8QhW-JAV6biHavz:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100114

On 3/10/26 1:57 PM, barnabas.czeman@mainlining.org wrote:
> On 2026-03-09 13:55, Konrad Dybcio wrote:
>> On 3/5/26 6:28 PM, Barnabás Czémán wrote:
>>> Redmi 5A is very similar for Redmi 4A (rolex) and Redmi GO (tiare),
>>> it can be commonized for avoid unnecessary code duplications.
>>>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>
>> Could you please try adding the following to your gitconfig:
>>
>> [diff]
>>         renameLimit = 999999
>>         algorithm = histogram # or 'copies'
>>         renames = copies
>>
>> and see if this generates a shorter diff?
>>
>> Konrad
> One more question should i rename msm8917-xiaomi-riva-common to msm8917-wingtech-common,
> they are wingtech devices. Which naming is preferred?

I think xiaomi-riva is easier for people to associate with a phone
they may have in their drawer than wingtech-s88503

Konrad
