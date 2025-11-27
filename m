Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D3A32D0FC
	for <phone-devel@vger.kernel.org>; Thu, 27 Nov 2025 11:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764242503; cv=none; b=FKj+c5VTzDqr2D4LlkUU0+hZf1uiwD1eaYwOjqtn/Gt/wH7h5umNmgq4c/hzzzT+Y+Fzao+4hIIxZM7pfjB/3ftSfI7cZkPJlqS5oa69Lbrxp/TE4RjM0GFwDnpzxIntl3o3NjuD3GTVOf92enmVxqySOKLUDa/SiMXzso0TP/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764242503; c=relaxed/simple;
	bh=lMuh0oVwYZEVTiOk5EGUod/MkgzwMlsXOhZoXj8AAvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MEuPco6f8lTlypqTQVhjzQOLoUdc9XATjAYHw65svzYoR9EtStFbhA72rG59xUNToNqWYVrhdsXEFp40oIb1PcFk/7vfCnXs81cgn208E2WhBNJpRrjYtcymMo6fondFJtMD0zUhyjKbUFNZUVfIa/XO76LAfKobJ6yz6t7ryBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eYvLNpiV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cyINu0eV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYvLNpiV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cyINu0eV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARA3NX6642720
	for <phone-devel@vger.kernel.org>; Thu, 27 Nov 2025 11:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c3s9CBxgTJiRQa8eHpTzK3iLUVMdFSvbtI6XrPV9Lv4=; b=eYvLNpiVcULrToGI
	lkN8EFl/NraR8EwGLGjZj5gIStpG4TD+Ja0CJxIythDS9boMKfEU7ix1c/PW6Rxr
	3Vw/x8NfYLAZy8KrrFxap+buvjOjHqKx9t9h2fUr3oE8rpPXL1+DVMMZcapSdCo/
	t9FzkDPlYim3ZLi/ewTPbuTkzhl5ckcsJZdhLe3yp+UDhqMoq8p1jxRwjVMpR7I5
	iJ18onIRDNQmS3m8zRvtAF7N/ou/ZoyoHf2yVS3zU2z5V9FgeexPsbpdU8OwnuAI
	NWasY5pTC7sDKg1fzhlWullTPRdR0TRfDPJpWzYC0e/B37J6sUds65vXAhhbPIDz
	JTKNaA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmja86x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 27 Nov 2025 11:21:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88046bc20faso1812456d6.0
        for <phone-devel@vger.kernel.org>; Thu, 27 Nov 2025 03:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764242499; x=1764847299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c3s9CBxgTJiRQa8eHpTzK3iLUVMdFSvbtI6XrPV9Lv4=;
        b=cyINu0eV4Tf78zCz1VFLJUjIuFgp8iYiThsQyoU4u9D+aNQg2L2bJRf7STCiStB9lt
         4F2nYfJYgSUi5agBDBA0Po5ykDFR1VjIzDHknO1gOmxilpVgkIpvTykCySfU+ZQZyB+X
         2ysoqmjvvztgWzAHTkNfxzflGPbQ8v8rg5qpkLAxEhy0Sr3f2zbn++si/LNcAI1LtoTZ
         akV9hCPU5Z16diO+vwDiXEUonTFD1Rzr8EsV21iV9Z9bEZdyDfQRYlnMpCI+nOMR18Td
         wHH/i6INUQc+lEThKrv9unjY6wEyI07AQXk79iUNVuzHh8Rsjm2Zr+0g6mP9P/VdKCSZ
         1lvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764242499; x=1764847299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3s9CBxgTJiRQa8eHpTzK3iLUVMdFSvbtI6XrPV9Lv4=;
        b=FL5JcWX2UEew9PpGrSuFmEiOz6BKZpDqnYf4aw97C3qF2jiAkEm3Cj/C8okFEIX7w5
         PsVBPapGo4kAmL7OATnczIk1f2N7E3mhV6sMeNquPFTjMsw+FlPYxGf4UnAinufPL1zj
         qF65Iw7f0porZZp4lnKTy6rGCxquHvvaShWWmOLTyMltcWgOWmNeB5WVh9XF57pZbz1I
         Vs3Qp4jToNyvhB6sJlXgMRDNr5519xPk5+x1m8C/Ct5sa4W3Lwj97GxJczyESLq2Lggt
         H0HyhI08ewniXochsGKqE2KR/xMxojLJU6vrjC+MxtkvpEzz/LkZvtLn4L37Cskj0O7M
         9uxg==
X-Forwarded-Encrypted: i=1; AJvYcCWsI8B9cU6gYbCAQ6fuFdJyYhlU1SbWbLBEZZrM4oDMXJYYQDhHsrhaL86J6ske/yQFI3E09q/+ndZifA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkiNfPxN9ibAZnlenfOjp4UI/FgOQtZEQEV90FJXyo2fmbRG8N
	D9hVVzW0Z+4yaQ1Thu283fUTiIcyO46nawm9FY6MSUVjFjlfMqW7GH2D9uTxC29doqLbsUrXfBQ
	wqNS3BCRdffZ2AK6g2C103X2CH5XXGXZiLM/gRV34byCzB1xzB9v/wsUwVUeSlIYr1Q==
X-Gm-Gg: ASbGnctwdEQmRuI3Q02aRCIgejMs2B+a268zMMd0PBl5tMeBfHjZwGlo6iiFtn8IPFZ
	n6zYzcmtu5UIr4KCcsYO9Y2g7rali6zI1nXBLqCfxsAhzHDlfWo0MDmw2QCb9iPS3RBM5pYhBnL
	TK5BpgCdagKveYyiW6u150OcQuXvPXbtxO1mJpG8emcagSdVevU9A/g2i3ft7SqlyQLamSKWV5K
	iRgd6FaIBuBigEfpRwvWxIB2ntmcTytXaT3q5s/8cfm0tu6ZtTecMSVXd2fKvvFAPvi172f+ZRf
	rrouqmnlv/M1J+kp5B1IwI1HkRAphQdNWV+M3AV7MqD18tphT3vno7SFRgw5DjYGdEHj+fhh6dY
	9n+47dnVg0OZlfBQ/1gdn2KvjQrcyhenrRsbNEXO9MYYYiumnLINF/kYU1wPn9qmRAcI=
X-Received: by 2002:a05:620a:45a6:b0:8a1:a5c5:ef18 with SMTP id af79cd13be357-8b33d47ff70mr2073723185a.7.1764242499081;
        Thu, 27 Nov 2025 03:21:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmA2YiUlnyWJRRFJeaUrmq4qRUMFf/7SQ5hNuvHsXbOBV+7SCnQ18XSfh3tYP3t1QZvn8IAg==
X-Received: by 2002:a05:620a:45a6:b0:8a1:a5c5:ef18 with SMTP id af79cd13be357-8b33d47ff70mr2073719085a.7.1764242498602;
        Thu, 27 Nov 2025 03:21:38 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a4b926sm135686566b.68.2025.11.27.03.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 03:21:38 -0800 (PST)
Message-ID: <52814cbf-ceda-4bc5-ac76-34fee485b418@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 12:21:34 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] arm64: dts: qcom: Add support for Pixel 3 and
 Pixel 3 XL
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Amit Pundir <amit.pundir@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>
References: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
 <20251125-pixel-3-v4-8-3b706f8dcc96@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-pixel-3-v4-8-3b706f8dcc96@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA4MyBTYWx0ZWRfXxn5BoA+0WR0K
 dL8ZSXh5B5K4mMis5yvlkRTGxMIRP5Tsez82xANVwwVSd4Oyi9lsMROfmFNJmiPjXg0y2BoWSHz
 gheZ4dQtBVKYD3OFu3myHhOQHHtU7Noy4CP4NYVlWsTo9mO4zgqb25WMj+5GIt61OmNLeg0P1Qu
 NF3vj6egf2kzZXdjg/14yR18pHWYIQXRMBxoeftbi8+lqs0Kd6/bcm6zyWvf+57Z2xewunIqttV
 hR0w3pZOxoBWlCviTMglbgOUT3buX6a2BYDH/mtisTT9UTWIZiMTBnRDjUDrIGE+leTQNvXSuQ4
 b2vgIQdAJp5T5Su4lr0rDCnlIpg4HpbDgHRJH4yfzflk5poXACrCBX0szyZng1c3r9OASXj1BCZ
 FW2vU6AUFTcTIflaszU+WUZJwG/3mg==
X-Authority-Analysis: v=2.4 cv=KbvfcAYD c=1 sm=1 tr=0 ts=69283443 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=WFa1dZBpAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xwgITF67okihWcdOKEYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22 a=MZguhEFr_PtxzKXayD1K:22
X-Proofpoint-ORIG-GUID: rh2HkddZJqMggxFu3Igm3kK61P0S953u
X-Proofpoint-GUID: rh2HkddZJqMggxFu3Igm3kK61P0S953u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270083

On 11/25/25 9:29 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> This adds initial device tree support for the following phones:
> 
>  - Google Pixel 3 (blueline)
>  - Google Pixel 3 XL (crosshatch)
> 
> Both phone boards use the same identifiers and differ only slightly
> in their connected peripherals.
> 
> Supported functionality includes:
>  - Debug UART
>  - UFS
>  - USB-C (peripheral mode)
>  - Display (Pixel 3 only, and the driver needs improvements)
>  - GPU
>  - Bluetooth
>  - Wi-Fi
> 
> The rmtfs region is allocated using UIO, making it technically "dynamic."
> 
> Its address and size can be read from sysfs:
> 
> $ cat /sys/class/uio/uio0/name
> /sys/class/uio/uio0/maps/map0/addr
> 0x00000000f2701000
> 
> $ cat /sys/class/uio/uio0/maps/map0/size
> 0x0000000000200000
> 
> Like the OnePlus 6, the Pixel 3 requires 1 kB of reserved memory on either
> side of the rmtfs region to work around an XPU bug that would otherwise
> cause erroneous violations when accessing the rmtfs_mem region.
> 
> Co-developed-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Co-developed-by: Casey Connolly <casey@connolly.tech>
> Signed-off-by: Casey Connolly <casey@connolly.tech>
> Co-developed-by: Joel Selvaraj <foss@joelselvaraj.com>
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> Co-developed-by: Sumit Semwal <sumit.semwal@linaro.org>
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> Co-developed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
