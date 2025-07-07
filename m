Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F65526057F
	for <phone-devel@vger.kernel.org>; Mon,  7 Jul 2025 11:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751887881; cv=none; b=RuWpqZ2zJAoZDDxe/lY50rIHiv2IVb9FbAgeodLpGWMsc2GKpTUKPJdMwGIZqPHvEci3OLtDb/Ljfm+5YKM9ik7LAdKUlSEd7ONh4yWEvjC2wR/BZqEZaTw+yugxIP6DLhcaCRhjHucRgCcq8v/dlXcCrtzoXWryuWDR4jNpTKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751887881; c=relaxed/simple;
	bh=EHqNUQU89R3sore7iAI2H4xqVvujymPymPAR6GGY8Kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LE4jE4tJyyff7yxPRhci1TUUEZw1I/edygT4/UBYKs7BBI+2hAfwmNTYuak5vikqRlwqBa0QFLHCdhDM0ff13qTfIbJIopqLVbcTTufv1S0OWx0vmPJ4ONNrT2+JoZPqC/b7HOTTez0ugnNjD7G2SS9bRi0lg3E4/UCLC9OMtsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CV28eBDt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CV28eBDt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5676omT0013069
	for <phone-devel@vger.kernel.org>; Mon, 7 Jul 2025 11:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DWTeIruv+S7Tt3sFAKNHbEJ7BbFsYXgmX08CqCNfWkQ=; b=CV28eBDt1MmHCUvz
	9jfUSDayPh7r516Y9xM0ovaJvXwfZ78AeFUW87DjxUISO96qc4qOkzO/iS9hrR18
	9he3jmNF9p4jwQxpzHpsjGC2ZcTB5MpDLDnflcqdCtXonL50RWaFLMX3WrKMDLLb
	jl/3own5ZwFZk1Qp0c7NYX+nZMqiNwb71cIEa/wEheS1tTdSV5CJvYjmD/GA/aRr
	ATwdeekTIOwv4+tj8DwiYJgoo3w9/v8XNsYx5FDTzLYOZM3kzJ2LBD7jFLlpzJbz
	jPEoIn4XjnmGFEV1I3TNboGsm7xsVBSNTTzQuyS3v//hAW7shmIEf8cjgpwQwNQH
	PaMk2g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0j43h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 07 Jul 2025 11:31:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fafc0e703aso11178506d6.1
        for <phone-devel@vger.kernel.org>; Mon, 07 Jul 2025 04:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751887877; x=1752492677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DWTeIruv+S7Tt3sFAKNHbEJ7BbFsYXgmX08CqCNfWkQ=;
        b=JYnbeFqFCBNRU4ejO2KS625UgfEcQOFyXRXgjd9PMQMlJd4y6b0dPFDl+rzFjssMpb
         eBuzcIKpNg7ld1naML0Rx5ZRbHl7AaYiU/7KI37H+28SSTTi04yTM76eSlMiAdSpIyLB
         zWe/mHWkYbwZjmtgj/6vRZz6eDMtInv9ZxlwFfLf5MMYRQDouvBkiz0s9CSoPIjERmAX
         WFgKHaqWLYnHHk+Ld0ioZ4VUJb+4biGI4HinL1B8edN+ACf+FebVL85rOH1BiXg5fVI5
         iYZI8CBmw/1/rsBhYYLDND6Pnu+Jvx0LRVKyQwdAuxLFwoZ4DOBJTK7lVtQKmkokclFs
         x9xw==
X-Forwarded-Encrypted: i=1; AJvYcCXay2ia4dVNJhiQoOgKK4lW/jubhUagc7D+Qmuqp/cdC9eO1I6cGeEaVevfTvBFBsmIWm5TILtXVWvqDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlxsBDVNDca3sJTOAaL9JtfAumuATqA5W/iW+q3RY3+z8Ggpz/
	5mRH7GJgtdFK+GvLv1R1JKZN3SjKDESIqCgrdMRAQrSjLPk8QLxVLkhvMpiIQlzX+hhir0vSSb1
	qkmpoSfjB3BcO6pUqiItWrGeB6czyhUU8pFoiTDgTUb7wgQp4gsNGYWZkufQV40gTbg==
X-Gm-Gg: ASbGncu1SErV1KosQCs1KsqN5uheltgO6YMVxI2p1k+Lqvkfno90yDUbrNzKxKIDLd/
	4jjSKKmbdDW4MLjkCVBfD1OVAae2buMl98D/o5SIzWr9CvS3fRfhgI8aA14eeglJdXB8izYU3Is
	yXrvLa9PqPrTri2BXqGFM0hHbo2/rJjlWb7O3Voiq0ogs+pzFibcYEkVeRYIHxKdcigZz95vNZN
	TJh5teMo5FzvPgFeOEgh42L0+0dZtGN3nXtIPuO8+z4CfCkoD51wLycNzYMHCjDSQkCnIQskYHW
	U1TJRPEEJOhwAroKox4tRk1XnOPkcUpmP7PI14sa0cFgLsxLVPN+vabf1akAerwMZmPmCUYxP4O
	6OP0=
X-Received: by 2002:a05:620a:440b:b0:7d4:5cdc:81e2 with SMTP id af79cd13be357-7d5ddc9bdd4mr594386185a.13.1751887876793;
        Mon, 07 Jul 2025 04:31:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpaw9CJeuBmYG3lV7sOgssLhggh0DGHOI8ZYixyktqQXpKdT92pvO9ZNob3HUzwHwWW0HtQg==
X-Received: by 2002:a05:620a:440b:b0:7d4:5cdc:81e2 with SMTP id af79cd13be357-7d5ddc9bdd4mr594383685a.13.1751887876211;
        Mon, 07 Jul 2025 04:31:16 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d93c8sm699187866b.11.2025.07.07.04.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 04:31:15 -0700 (PDT)
Message-ID: <f2793909-4210-4ea0-9f26-af03e0200c5b@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 13:31:12 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pmdomain: qcom: rpmhpd: Add Milos power domains
To: Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250707-sm7635-rpmhpd-v2-0-b4aa37acb065@fairphone.com>
 <20250707-sm7635-rpmhpd-v2-2-b4aa37acb065@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250707-sm7635-rpmhpd-v2-2-b4aa37acb065@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686bb006 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA2NyBTYWx0ZWRfX0Kss4dCza+A2
 12D/dIaf++v1ngSRyH0AKLv5TEHXo5tMF0g8FE8Pp7V77l8lUuqjTQIdUV/4NTAj0LuL4uaYTJT
 9naEXK9dveUxsGdu1qez4/sSFznRKRRCw9d2/qBT2xYWnB/06Qc3WhRtEqnXs9JZygfZ56wXZTf
 8qQFRWwO6AKxmZrWflYJMOkQnOcIi0Fa5IrhTkrZDAXuiJzVj8o1Csiomn3icgHxNCrAgb96TE5
 co2PS5DNp9onYzFTdLSoWB8IG8fGN2JFke+bnyL2D3ZSPlosn5fp4Q7uE6Pj1XyYxG23DjTz0xz
 No0QH/MEi+QRVouJnNtK8mZIDO2iT9K6NuPGOx76lF1r15gQECoPFIcCi/nB9F96B196j7pFBHD
 vfybaJpTxYiEzNR7+QKrLbzv4wbZiF+b4rghFQwsflu+c81Fmr6GDFdUwyJwzQ9yDqNMHMks
X-Proofpoint-GUID: A79-VLniR3MJR5sDKy6ge4Hv4FgyEQnC
X-Proofpoint-ORIG-GUID: A79-VLniR3MJR5sDKy6ge4Hv4FgyEQnC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=973 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070067

On 7/7/25 12:18 PM, Luca Weiss wrote:
> Add the power domains exposed by RPMH in the Qualcomm Milos platform.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
