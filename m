Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC6A331223
	for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 12:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766145971; cv=none; b=iP9h5B0AJBPUMp6SfswR6gXSGb47rQ3uv7vEfpyZpGJQX4Eg14ILoKxa5cTGBcOllKHomwjWgM59kLf1fmWGf1tAqtzcKUxFe4NdGUm+Ff5CwI9h6WWBpDXbmb5bRtYnFPDhm1aqn+rKXmLdW4sYXS8exKC1eqjT5o/5GsCRzv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766145971; c=relaxed/simple;
	bh=wdi/yODiJ2EWrZQaitI9NiRHflatT+fACXV3XsCgRzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yh+Ew/Krl9oqF0evQeierHJUmyLywWnLX6YN03eR2dNswgl07rhOviyF/yJ9OlmY1+2VdLNaoZHop2ojMWKAO4X0eoVTuQuhDOOUYmdHMs0WaluBG/s9pYIpIGSJjLiVnuoEMR8wPCht781B8vHs629KNxBYcEJ/0VE+i9zFhuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nm7iX2Bq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IEZAKI5C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nm7iX2Bq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IEZAKI5C"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBMLZg1772081
	for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 12:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VGoeFQSnl2WPi9PDYnu7OuHO3EMjoE6y/soErcQm+ww=; b=Nm7iX2BqQhn30U+o
	50cnYUNhB6zF5k/lvJ62alajHIUYDfvX7tK7ke2rZVnoX+sqVv3JAqXGfXJ4Sd6q
	mv5UQNjo5ngyt5AgF7rllJq8LaCIkrjxCE2iyMYnt79Xv9LADGnlylR8jUY5xY5s
	YrGs51g9YiekmQ24TJFT05EUMNdZJsO3PyQmbxuPXUqXtqaxjPLHBGe3BaCmnFCm
	xoG62CyOpi46QRlleDDe6fnU/+Z4HQKrNd2E6b+e2PUZLth7tAxk4dGkmFsf/jHs
	w8mxqfLKs6IJ/8rj28VQnMRLgSnhl8VlOXorqC4HuOXLVkrT8Qo/nUFa6Vnp7Jfb
	QqeW7Q==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2bjjq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 12:06:08 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-64471aa9ee5so347654d50.2
        for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 04:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766145968; x=1766750768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VGoeFQSnl2WPi9PDYnu7OuHO3EMjoE6y/soErcQm+ww=;
        b=IEZAKI5CfSrJc/BblgZKnmX6mXNESPZmU0Lnm4nagukCJuzcE3S7ieWiZG6qkOuDVk
         FTMCm1rb9PCRO3nJN0WEGqaDO3Fm7kwCQEZ5ciBVspjN8mzXyc8JgkYBGdpNIQdsgslb
         8nwRgBwmmx+QiYBH8H8DaXdviKQtIwbbhaVT1Vp9aUvZbk8mVfpUFADFdZCjpRJASZzv
         +Aokh5CCzIIcURIorLqG87MSwl0myOwv9ZvX5LIt2TgI4dihPvxEPUhVZR/bpjJZIKGg
         gwN6H6gN/w6E7NqYBZpvNSXoOBpqt0Mv27VAI9lxU9aJIDQufHMV3Qp4SvXVzTKnNbW9
         mTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766145968; x=1766750768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGoeFQSnl2WPi9PDYnu7OuHO3EMjoE6y/soErcQm+ww=;
        b=vXV7hBvHvJQ86bUZwZNlf5gmWEptrtbJJhTHmCMzHUQWo8CL80BOJvIanrqc5ixFvY
         787jpb+BvaECvN1vqiOLDApT+Avt41qV+rKNLE5ZQKuPCR8ckORvLfyB6ZSMxlsq/Uol
         uw3tVIqf+iL919ESsj/rWCie7pWv7JZ0aOdOgl34/EckvmqbES8VHdpJTBb0o6D5+qOp
         SJ6vIvQEp+nIUDNOBTSD7U9TN4yi7yMna/vr/cycoLXh3v9vA+SdB5lpmx//KXo0JYd1
         XTZB3LX5iLPQtwkRfEgzPKo6AGjfU/8ljQwEAdY+Aoumpy3r5B3JPXtIQo1Ue8O5yprs
         ksHw==
X-Forwarded-Encrypted: i=1; AJvYcCU+7pnhc27U6yp26Db2tKECl+wGc85AnjItasQxvAEYfDeWvyk1dXUfzVV99r2NCPmtCQ2Id8g/RbLuUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhEycy/G1e1WqwjHLEuoFKpuyqRy+dJ4oujnjqDHivGUrV35fj
	K221i89onQH9HaEwCDeS2ZzmMELopXyvSEwqsjQgSoncbMXsrp+GIbOstNA3rOsm5oBDUqxuEso
	ITT8KPBNBjqjK7Gj55xmXLIe6JUr8H73sYwtwyf6J379oFwjGOuTRdSSoG9VexlqWBA==
X-Gm-Gg: AY/fxX4kt6BloanIhpANdm3bTw0fUYWcFWDpCSaSKKj406uEqZ9ckpwvwIscNv8oTre
	O1fF5UovrjjZTEshTk0JEVmH3P/d4MWJBlDn+5gdROC9HnOI4Nb9dbH8lW3NJO0md4Ymm7DfmPv
	muTfoPkLHQDASG+5Hu+CYiwEJIAee0OYdDkbBMQlaQIzFyzaklgHqOz2f2RGSz0uUwo7V9rS7uA
	Y2o3vAUEpDJmPNX4WIKm5/Zcj2HLSNW2x4JSJNimSbtE3gcI9fuVOLjyDbSbueSGVtG7S6tv+nt
	HLIXveyUel5XbDRp1DFaessOdd3oGMZejU/h9zRR3g3UVLKAsLEqi7L3UpdPfQHEjqr0Ty8xPe9
	eFt5CGzR/MBDTMu7AUl7b+gRTQZrlkzBD/vjkw/uI2xIZUhX74naJvv/5n3S/TUGD9Q==
X-Received: by 2002:a05:690c:6610:b0:78d:6aae:9cf0 with SMTP id 00721157ae682-78fb41fac50mr20275907b3.9.1766145967759;
        Fri, 19 Dec 2025 04:06:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHusdFDh+i/DW//dWaTFL4zVklWp9Amv8rOiySIQIwrUcVabQh8tJvaUfyM7fnTeu8yOfASUA==
X-Received: by 2002:a05:690c:6610:b0:78d:6aae:9cf0 with SMTP id 00721157ae682-78fb41fac50mr20275637b3.9.1766145967223;
        Fri, 19 Dec 2025 04:06:07 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad1e6dsm220744266b.21.2025.12.19.04.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 04:06:06 -0800 (PST)
Message-ID: <c2ba3b29-c92a-4faa-8161-ac7e59de16df@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:06:05 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable options for Qualcomm Milos SoC
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251219-milos-defconfig-v1-1-f58012ac8ef6@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219-milos-defconfig-v1-1-f58012ac8ef6@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jBVmv2uVh9BuEhBYkNOzz4yHafYtP0Kf
X-Proofpoint-ORIG-GUID: jBVmv2uVh9BuEhBYkNOzz4yHafYtP0Kf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMCBTYWx0ZWRfXxhtCSZes+iCu
 1MYMtYnYuCe+Rk5jazYiO+vTN4/2r9hy9HjzjUhQ1hrcsdOjLovjQGKby//uRwnfjOBechlK6iV
 bInEZxBh+UZEdHyoqNPw4bQ7wWelZDprAGXB8/pGSBPB0AmdQDRKdLQ0ZZerGVdy0js+TRSjdWE
 4vwq8gXnztz3KcLJD18ZCDd4pVNL/RPzkqzlgoYE5oYwV6J2/sgbQ3NIzEdv3Y0CJ+GC2mtxJ9P
 x5z7H3hde5y6eeL2Kjg2pZaso4OyJCSTioJ4aVGR+/JOw11BpIUuZmrQU6LTAfxQHtnArPZDBoX
 jmrLX4l1s8Q0mpnoHIEi5srE1BVd3nFROaYevD/ZRRTOWAoFd6bzmZsh0ES3MVzhLrPJOabUxSw
 ZGE4EI+UCvX7fMPu+IXTSl7O5vd1KUQnIcdAP5XFVHpn5rON+b7GOOSyJHyFOYtb+CccEeTSqr2
 H9naac0BTuBLTGjC/jA==
X-Authority-Analysis: v=2.4 cv=WYwBqkhX c=1 sm=1 tr=0 ts=69453fb0 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190100

On 12/19/25 12:39 PM, Luca Weiss wrote:
> Enable the pinctrl, clock and interconnect drivers for the Qualcomm
> Milos SoC. This is required for booting The Fairphone (Gen. 6).
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
