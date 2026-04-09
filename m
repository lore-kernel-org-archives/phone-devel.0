Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E83F3A3E9E
	for <phone-devel@vger.kernel.org>; Thu,  9 Apr 2026 08:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722742; cv=none; b=UVOsjglL0NLk88AbFTQSTePCdb0d0/dzW/skMyi7df+5RnCH2saR9WyGaEpyb5VjnFdQtxEkjSNcGmOwGw4feQ1lEf02q8YzumrwanV33wiIPNIHlp2JskzeY7VY3XKh0QCteuGlLoLaZI6oimnMlxpqkJBnHR3NviA5Hel92X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722742; c=relaxed/simple;
	bh=6mMHTYpg3tnj80PaMkaXbeENESN9DNQ9bb2lP3rCcpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WwS3o/O7ESKhbeB4odLkFSZos7EB6lpusLkZ47FlPiQUz+MbMXhoxvyNSqOOL+bw2XaDrNZiaYjHTNDiDqScwr65CDBcUFNX+HiMdvF1JSMwY7UJT10I2qmKVTqSoIE8YlYRIhvZT2kfQUFWJ3Wvs4WLIJ66xM+pLggHpUowJkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XS3FDH0e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GV0a4DQY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XS3FDH0e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GV0a4DQY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394e2mP2611820
	for <phone-devel@vger.kernel.org>; Thu, 9 Apr 2026 08:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	142GNnYSU6d3FVCHi/ShZiVXXO71kNyAO5uT6ivLtnI=; b=XS3FDH0eci9v8mGt
	KZjRkIMheID5X211cvA8p8TjqzVqq6Nvt9TN8YmqD9UZGGA0CPdpBnZUQVemCNDB
	FFZaWapSS1imgxFH0lIBZam36/HqMsBQQHtVEndWTlN253sPjTEOG0Q1G4EDs5Oc
	pfwoH5t+qB/nR/R2tFPcL1IIlIvV0HMx6ZIZ0qEgLmqFWrmkrO685PjHRcoIqfjt
	ZWruGu/MCMdMrnLamqaYYlplbZ++GmrKVnSVWAC7REWBnpC7k2gqUBJukkrl1M1/
	19uBjB1iTGqaLSFq8IhlVFw2a3aBKtTdGoE4oCRD4TEmrSO0TNliOI3z4O7h2q9q
	LkB9xw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt28u5sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 09 Apr 2026 08:19:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d45ebdbc9fso8788085a.1
        for <phone-devel@vger.kernel.org>; Thu, 09 Apr 2026 01:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775722740; x=1776327540; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=142GNnYSU6d3FVCHi/ShZiVXXO71kNyAO5uT6ivLtnI=;
        b=GV0a4DQYLXW6IiRO4FM6MlKXYZwSjCxu/TaRLInEtwdNDNZB85YOvUpLGIQLgZfE6Q
         a4vImr/Xl9lOYjTuqQ15lB3JtKKATlZ7hhycHVL2GB2snINBILpWnMuIEte/zyroqf3m
         Rr0NDYXym8+88UZ1dGAihFwZoE6BtSVNh4W4b+3n9OhNADtV6/q4++ZkbAwVBOC8hAMo
         08xU5ePE67/uNUwJf2qpquXRcUlmNL/L1qjrvxtGW1Hx/sSVZ/XKoZ79MYhpEObma0V3
         KJ9I34Q2Yxs4zWlraLnWsUr+vxkgKlmjS22Vg/6x1A/jjwWSnLdel6c31OZpyhYLptjI
         MfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722740; x=1776327540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=142GNnYSU6d3FVCHi/ShZiVXXO71kNyAO5uT6ivLtnI=;
        b=Woo7ZbpoJ8DIWWWdWqnyb+AqgbEAmCWyZxWC9mOjOyILmCw6ghL0WR5OMwMk6n9jpi
         6jUlBaFvt/L/9pRU5C5nuQSg6F8oi05u6EXia1tBrWlys3+tvPjeMODT5CS5os9lFcxV
         hn9QZl10etOdlucFP7o5McAbxSGhPuC2cWLJ48QTtwA8yOlwronp/DsU7hPqUaI7R+lf
         W4tTr6I12qZLObRn+9mJjZJLGjLOXtnTNd3lOvdIND9fH6qJEEyPqLfvb7GFFv0wzH2U
         9XO6jNHMnXq7giX4b0qwF3dsFS+fWS6hJGCFiZIODN8tDbuCuLo2Bw89ILvUOkZFeufn
         9VKw==
X-Forwarded-Encrypted: i=1; AJvYcCVj5QbWKxPg46jUN34vp/aHK6qmB11YBVTrHFMPQRNoYt9o9MiafllN4Qbjk0WeuKPN+pe8nuesxx0LOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZGcTN9wkYQbSoNKDltjcYTrYK9JF75sILLEdrHcQAv2yPnUyk
	aXqUwfz3dmflaO3KoCrAsh4MAg9aJNQ0xP3tuS4J49Q2Kao3w8wtKHfjKGmfYYgco+fi+x/kBKv
	llEsicKkTArrKX9C9MAuM+dHIEonQqvjmxa3AXc00eKUgMCdt5LcAzpkeH1DVT1osNQ==
X-Gm-Gg: AeBDievyXphxnUUE01a71v4gzZ9LBBJboNXvno/nVArzsJzlREjVjt3JZUpVhUS4GFu
	KrfHUOJOh55rKDUN01qbN/3CO1CdPoKH5aUPfCjdfUpl5BBqI0YeV3xb9ugJiIj9F+vMMWJBmy8
	ay3XZ5mP4P3hERpERaaVP6iI3Aifx4gj0JGoqhsnmYMukJva9X+hQ02z+ANrauFbKwj9AF0b9KN
	6YVvP8uJmtFarDEg9wYXAiEEgw3hGL5R9yAqJZ71pJkZY7na8vckqmsMnnLhuxcA3Wx7J62K5ju
	w3Sc0Pwh4zkRDD9fwDncphrf/782ccGGclZYjRL3RExselNDflmu8mKcQT5H288R31G6jsLJOtC
	H3JziH3GC+t/dxVzCmcFWgso/qJHfpBSQJ3yxl1Hy8pNcAeZc+hRuD/LYzep25lBY/JmHWWygxm
	plMwM=
X-Received: by 2002:a05:620a:460e:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8dadc4dede9mr743429485a.0.1775722739929;
        Thu, 09 Apr 2026 01:18:59 -0700 (PDT)
X-Received: by 2002:a05:620a:460e:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8dadc4dede9mr743427985a.0.1775722739511;
        Thu, 09 Apr 2026 01:18:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02d37620sm5500422a12.2.2026.04.09.01.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 01:18:57 -0700 (PDT)
Message-ID: <0bcb76af-35d9-49e7-b3e5-32e62e897211@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 10:18:54 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sdm845-lg: Enable
 qcom,snoc-host-cap-skip-quirk
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260408-judyln-followup-v1-0-823467519b59@postmarketos.org>
 <20260408-judyln-followup-v1-4-823467519b59@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260408-judyln-followup-v1-4-823467519b59@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PO4r9KzPn4P74zfIy5cq16SgVsynkQcW
X-Authority-Analysis: v=2.4 cv=fIIJG5ae c=1 sm=1 tr=0 ts=69d760f4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=yndPCfnnJPvdZL5cpNsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3MiBTYWx0ZWRfX3ZWNL8ttxOT2
 3VCEqw7gxZA5/RmQly5pSI0TQD0wsRBBGaaGEUUeIQeq0Qqs4ILscw8vkGrfT0SMChJ2RoG9b2S
 f4ELcgQmK9YusqCKa8aa6ijp5GByWq3ny6On430klI6OCSSuc6OSqiRWOtldsas9Q5E9uOWWg87
 Azl3mucxd33RjI9ov18djNjAlf9UPD+tM2qG991nN0DRY8K8SPg4cq7D/N6w0StDDLyHtjbyRMM
 2a/7kWV2vJhtX98QmTG9nuiX1vGImL6hqp19YVgN1i7AJ6SX5dbdBbQ5mrjJUu1UOSfXbe2PG1/
 5/TAHHdeMBphotCmC4Z6r03enAtzRdNWS43PddixeaHzIaimvAhBemSRuSBDKrFlSRMBoEGRGQ+
 QOB0gLXQzs5E4JF69IHuKOPqHco/g9q6/wAkIBtyOpl96Zlb9RxWdIrchjNA6cUYrM3VoP3/1r2
 LvsR2wW9KMQ73O+AZ9g==
X-Proofpoint-GUID: PO4r9KzPn4P74zfIy5cq16SgVsynkQcW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090072

On 4/9/26 4:41 AM, Paul Sajna wrote:
> The WCN3990 firmware for judyln does not respond to the request for
> host capabilities. Add the devicetree quirk to skip this request.
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
