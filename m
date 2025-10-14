Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9453913D539
	for <phone-devel@vger.kernel.org>; Tue, 14 Oct 2025 12:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760445079; cv=none; b=N8qX4GGTLf1hmMiy9ILhCYXwBSIRmBZVzQQQQRza5MxoPmqxX1SvKywDqN0eoYq/ONNOVnWuPg/4EdNRLK7TQq0VH/j0Da05Mg83GYcCnF2sc9RN31fNsG3/+Ldh5E5JoRp693sIgsqM3zXOmLv3ejsMV1HyNq5jEI0W2q+kWH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760445079; c=relaxed/simple;
	bh=TKC6A17tydWDC94IwMFkA9hnSrTjZmAGq8YUv4bHuWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WeXEaQDhZfV4FYY0K7nPUR7WsJOQb++yxNNZnIGkByxDxU3NYeC3SuTmVcx5ndfGfJkDVx0M9Chg7K3HAaRYlIirvA3l0Ds7dJ6v9+fqAID1uDNGCft0yPqu2B3lOz2wXvulo+enInM4rDaTs2dgIt1lQydRyAFL2zhcyv1OnSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJ17PiJS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJ17PiJS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Qfu001826
	for <phone-devel@vger.kernel.org>; Tue, 14 Oct 2025 12:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ID2HJsJjmIngtB20ldfJiYb99xBQYJlyyVG2gHKSJJI=; b=jJ17PiJSuBQ8dVQl
	xg4qUWAegEIlqeWHWI6uogEggRvOYUOL98bF2Q2wmf5ZpymZieWrhvzG2KyE1fCe
	ZoRdaQd79T4kB9h2Wxe7LOfhq8upL/azQIBBt01p+7dr1bCwzfk8pju0VV3O/lnm
	d4F9TV9/ybycVMCTt6P4tvBLtIwVwIe3Nuwg5zk0AlCVeSBStPfRXW/WlBzAwftX
	crCZWDEfbJqHyGbvzyuapEIPIuUiDhIK7SgYZoE5ohuz7aBupRR3vVKn4FtSEOS5
	aztb7LfZceVoCPjkohlZ6M1dAgxYA2fF3Srl2b1yEymwKqXW/Wk/djC0cu9cW8uI
	j2vKYA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk8dw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 14 Oct 2025 12:31:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-860fe46b4easo295941185a.0
        for <phone-devel@vger.kernel.org>; Tue, 14 Oct 2025 05:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760445076; x=1761049876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ID2HJsJjmIngtB20ldfJiYb99xBQYJlyyVG2gHKSJJI=;
        b=kRo8UZ1rHJ4QlrtflOsZasIhtL4QDP9STxA7ojAYSgGoFAO04p4CTqyhZgrAczwT+O
         pKzBIPzrapZAcaRDbfrBeMbn5oSwQg8zIBjNTj6H1onowvm2JTW4/Ja0EfHCbUcVgeop
         weqwpb1rtVsYtu0YskmtdxKxwPINLAObfMHIyPIsotP2Zk0jlWT3u9e0lfb/5FJ/amHI
         kKhfEzNwPHN3eNrQJP5NzTjZhhBZ2VBnt5YB94VfD8tJiek0w681lvgdK+l/qtiHij4L
         ghP33KeYYa3Rok2OvxcDS3tYbxoutWis7Xa9VE/MfksDXgsURA1BoRq/OGJ5VHyNaNNw
         verQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiN4Onc7j1AQ3MTHDRGIT91iWhyQrEaD0YpBeoyVEZW92ec7/yrIGWvu3dTsEVtOrJLl/7KTo8jR3XAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqDegY/2MeABIL8UCPRouISpyBB5l6EMo3+N50cMrWWaDcEp0F
	zkMIcTpyoO3pzcRU3BM5+llW3EtIjL/04v6jZrlr9sPQKiUg7q0pGCQa3i7iB2FvfOQobEn+DJU
	xIb+Uy816zuqekvvowbzpjBDBFHJkj/T2io5zapIhyNaY6z0bUzCvd76sgV3HNotklw==
X-Gm-Gg: ASbGncu1mccjfHF8blfY+DukvThsS9uyhtGaLMx2pIM9b8j6h7hpGyax7F9qfzKs9CI
	ZME3SBy1/+h2rmjCngVYg2U+8k1QbKr48Xo8aZ5wMmAUtTXhy8T4BVjOk0jhdfFt7woZ10qvvme
	f7r4LNcOe+7+BHsiQ/bRaAihDrIw8+qYLtKvLx4IFQnbjLWCKa1CkqmfSHpssiSk8VNBy+vw9aS
	6fx6NFQfy1vTC6dK/XGnutTCbKxUNZhDgV+RklKcm/eNb2YMb8mm0IttmUcz4KPFWa2SsKuEGev
	fInxeEMicVVlXxzIfXHYOIvzusYFuDRBPV6Ewkq1i8THe9Xc/EfmrwFOqT+fhO+sg1nGy/EKEVr
	KkLD+o54zFdbZZT3liuJ2yA==
X-Received: by 2002:a05:622a:8f0f:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4e6eaff3f88mr165143961cf.4.1760445075701;
        Tue, 14 Oct 2025 05:31:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+j4D2FNO9vuOjT1YgWIBgUGvxk/FKtuOcXceOGc4py6Qj9TBJaMty1wCNCO5mmpGa1FyaIQ==
X-Received: by 2002:a05:622a:8f0f:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4e6eaff3f88mr165143241cf.4.1760445074624;
        Tue, 14 Oct 2025 05:31:14 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm1135306266b.38.2025.10.14.05.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 05:31:13 -0700 (PDT)
Message-ID: <87af3cf9-7eb1-44f8-853c-d6bf973040c1@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 14:31:10 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable configs for Fairphone 3, 4, 5
 smartphones
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251014-arm64-defconfig-fp345-v1-1-53fe1eeb598d@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014-arm64-defconfig-fp345-v1-1-53fe1eeb598d@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LrvQQa7kZ7dP83lj_sZ2h0DoWxCoKZQD
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ee4294 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=AqWm8137HdW1rLVHM9EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: LrvQQa7kZ7dP83lj_sZ2h0DoWxCoKZQD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX/jnJF0alGNes
 O1hhnBuC1U3q6Bb7ITx/334tl0/dRfOmFenkQG1kuSZvJdMOaSoWjrJzcUQyRWibOeeGOs04j6f
 XVd6pBFxUAhUIV48wvPt2FiEq88ROaAqLhH2ViAgNHN9zW64uG1zM9NCaKdMRWxkiKpwWIHXvth
 Npa/e+sKCJCjnTJla7MJmaNMqaQ2Ka3Udg4D/O+PULECD6hUDs0xiW95R3DlF3TP2lSGLA7Afcw
 PzKqSjQ5kK7KnsbqZ6WE0AMCWfAgudffVFvpVZY0D51nmwnpCMZ80TrjcLiRMu2dEWvqwpytkNt
 4ZKY3LjMz6uKTIjLTbN/Dujpj1dBBagTEsS8l+WSFNl1YoAvrVbkhmnA/Cq7lxQw20jDaJHYWBM
 C7lmswGrB5lPQjsr2NUqbhw+WOn1Rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On 10/14/25 2:11 PM, Luca Weiss wrote:
> Enable base options for MSM8953 and SM6350 SoCs and device-specific
> options which are used on the Fairphone 3, Fairphone 4 and Fairphone 5.
> 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
