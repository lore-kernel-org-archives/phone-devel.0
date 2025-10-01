Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AC727B4F7
	for <phone-devel@vger.kernel.org>; Wed,  1 Oct 2025 08:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307273; cv=none; b=U6lgla6mvsv2BGZ0HMIvwUT+OIuerfRpEgQlcE5dGfcdWGQzQ9eRmPatuHvk1EXGocvL2H2nTKqKCNAiYd5fs91jBecKmAa8AAHi9UF1YJtLlWTiOejMkYr/Pqdfhz/+KOIjjfy/ZIC3EDFxBYVQgTglrQIAM6b5uY3/6kWUyVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307273; c=relaxed/simple;
	bh=eKDxOd/8infgGPrJNe1yhZvRW2gOa80XvT8nyZkZHoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tdJWSBUBxbZAgLaFiCVrjcjQbMkf4IpoA+xmZPyz5A1MDLJqwaUqbC2+01CyBwRODXHy9CS3OP5IL+GNj0wL8ZwdX+39ChLuH2GZMAhMp7X2/dcX16BNN0yMjX/g2JbDFH7889UlJIPPnM4hjH++xiqqqP2WwxVaxpSL2KNHeS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l2DiGUIq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l2DiGUIq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5917KmWO021268
	for <phone-devel@vger.kernel.org>; Wed, 1 Oct 2025 08:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sRte5Fe52kG9pSHQFH/MbokFPbtdU+9oG1CqeyDC+9w=; b=l2DiGUIqY7SdY4wo
	uRnMahgndNelhmGeIXksnIzQmSDntX7sHyvleBhZkcvSWA9BAXdFfCxHIifmB5sn
	rAeKldqI43SZ81O8+sIiIxs2AF+rMzPkTMNnZqq7DwZaCwFvJT6U1x4GOqlX+frG
	wjrqeW5biyAYO+FBPNdbx8VQayJLiJ0Dne5J0WYm0L0V7xaI517n2sPAe5/il6LH
	n9YrpZxgkTtTkeAm16s54jNBj0kgDU79xIm2WHDC62kqKzRSbVcVlpMj37eb/UT1
	xym7Vtdt2bP3BNhbFGABKLnvPfHS6G3fshEKjbnp4pjH0n3gQGbKAQRzgqxbr+IP
	TiVJAw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49gyu185bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 08:27:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ddf2a2d95fso10313291cf.3
        for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 01:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307269; x=1759912069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sRte5Fe52kG9pSHQFH/MbokFPbtdU+9oG1CqeyDC+9w=;
        b=m8Dp7kkG/35BNVBQYYWd+QbSW+sRiM553I7cJCDwfOWsQnv8JHJOpwlJN616Rk8e+e
         9zL8G/kuQeYQbCWyIebxSWZRCHOWSEreeUlba/9D2Mqb5H9jzuImfYPL9BbcjoicKgWl
         V1+m24xtlxouCFb4JcrHh+ZzotaRxn5B71BkBUNVzX8208hf1vc2tNyGwUKOuB7/0lWs
         BTcjLsRHUFtUgBXsRmQkF1y2BXWfk9hSAiSAgqwOMcfxKwbToqTqtF2XkGGjQ5F6pFBs
         zcQ28MPIILs/6VxMw1Kbn4hhnPx7J+gDBi2gJ/UQAlMEPut9sthyAR74ZZkH8Sq/q8uN
         vj9A==
X-Forwarded-Encrypted: i=1; AJvYcCWfkS9YBKIwi4g+YJV+8hW0C4f6P/9uDl6TXxd3AXGUQyHKO4voXb+I2Mvv8OrKfrcBM+cL+ARPFFtqeg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbb/vV153EIj4SPgdeiZh2hui0I6QqDTrAZXejd88eERwa573c
	8+ZW/AT1tgiM7jhNV29KuisdshFKrXISiJkiZKEhGNCgaC8qJlcLdkGg5wVFg16UnGsZVJzPIo7
	tajeIuKrQSZ4G8L1wBdH9cBixtiqmksrxtOlhKDNdczgufwTmD0IdEKqvh4B4v4QzWw==
X-Gm-Gg: ASbGncvvYZBn8AllB9IHm9ksM0f9gMyWH0q4VA7IiU9b3uYATIUV4+4YnFTlyS2d+8H
	sUU6o39jVA0ZPqkOrllnqlWx9+CO759bfSVRKLjI2JCl/oxNaIQjmije/NDNcorrtQoB9jV8pqa
	vnFGCwNnAB9axkp4qVFTtnxSltVQaGXhIcPmDR+FY8sZBMnWcazjLypAtEj+uO1CKF2ZVSvzJN9
	nqhahTgLipzcYjkq/PifvFQHChzJhWso+qdpmIXtUT6B4rgyWorvL2d3WL7knclYTdgNelmECdd
	k6anMWMaW7fJOI11/jot8vScHCduc5jnuQbXyemClZGvRRed7xj/eJpV+cL0Zjn7FZtAw8k6xF7
	1HzmvQ22uFQyoE02Z2bAHF24LnMQ=
X-Received: by 2002:ac8:5e0b:0:b0:4d9:ac87:1bdc with SMTP id d75a77b69052e-4e41c547752mr22283351cf.6.1759307269063;
        Wed, 01 Oct 2025 01:27:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGazXCpf23PMH4PrA3/BHdRst7lhfzNEub7Fo50BJ0w2oAO8PQN8uTngF/EvP3RGSn97sQEKQ==
X-Received: by 2002:ac8:5e0b:0:b0:4d9:ac87:1bdc with SMTP id d75a77b69052e-4e41c547752mr22283201cf.6.1759307268641;
        Wed, 01 Oct 2025 01:27:48 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3b4271dea9sm831995666b.88.2025.10.01.01.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:27:48 -0700 (PDT)
Message-ID: <7b1286e5-f685-43f9-a5ea-c82a3ea8a1c6@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 10:27:46 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: qcm6490-shift-otter: Add missing
 reserved-memory
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
 <20250930-otter-further-bringup-v1-3-7fe66f653900@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-otter-further-bringup-v1-3-7fe66f653900@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RfGdyltv c=1 sm=1 tr=0 ts=68dce606 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=7Ovdx5uLAAAA:8 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=Q9X1YL7jsAXwpJAzmCoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TQZWkJv5rNK5-PaLMsrg:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: qVU4v3VsZ5LhqKdEbNkYwIypXc4bPSys
X-Proofpoint-GUID: qVU4v3VsZ5LhqKdEbNkYwIypXc4bPSys
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAxMDA1OCBTYWx0ZWRfXw7PH/d3D5El8
 ZaPnuMnOBqrRRDFUuNHuZNfulyAxouIXZu4xsGt1rgTuvMGYL5EP71ljrt9y/uI4GC6+r0XdRLE
 Zwy1fsAqFQ39Hqgz9kRAhNrp9iTJYO/2tH+TXacpAhcW88f7/2EkuDHAxzCHYoaOsrGJ0aJweMr
 TL9HMJOV09Bc6NZDvXhnZ7FV6PgdlFQQz9CDSAEMAB+6PCjSUCE9FWBSdAI43SrXmsxv/cWvtfk
 domIwgNgP/Q5tWejgNAYsIjHpb+YzvL2xeT76ojEt0Kw1jBIOXM/HuFV0dRNfZxDZOl309R6kJr
 UZarHX7Zuw7i5GNN5dOjvfSEoCQv1sFTRy4OXs3qdP3vfk9TepqImA/2syLicmekAZ0LyrFCAOd
 EFUY19aUG4uAa3f1RoOlny5cBrK4mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510010058

On 9/30/25 4:32 PM, Luca Weiss wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> It seems we also need to reserve a region of 81 MiB called "removed_mem"
> otherwise we can easily hit memory errors with higher RAM usage.
> 
> Fixes: 249666e34c24 ("arm64: dts: qcom: add QCM6490 SHIFTphone 8")
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
