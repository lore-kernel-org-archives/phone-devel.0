Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9826D15530B
	for <phone-devel@vger.kernel.org>; Mon, 24 Feb 2025 20:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740428762; cv=none; b=iPFuY2WWUTvmf3nLAhAx4bBOWiNqKhuM8l5Zl8ParEeG9/SLxDe3D/0vVKEB3GP2mLzVwpwZssUqSyAiQRWT6oez0nN1YJLf26526XnfNzoVCPTFTlCi1byKsYXH2fHoyAvWw0dSY8Ey/G+qriuKT7JlxxcN91MXPr+RefEGMQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740428762; c=relaxed/simple;
	bh=1j/g1K7Ja5vbzknnuLCVHa/8XApl+L1E/ioFi17G0B4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=agG5JV/ESDgEA8DAi1F6AbfJMJTk1RxsVFOtzG2gJ7SnC6a7gASSRsRxaPU9eA7lSMaGfZa1VfR7QH/FiMVeVqPNTOXve8iSHabQ0uXe0Qn16DfDldlzxjmuFFaMECrXuQXE4MkmNKUf2nIJG/yDbyckbeCx4PdaYyXcV/7arVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+cEEI41; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+cEEI41"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OKOeLI012817
	for <phone-devel@vger.kernel.org>; Mon, 24 Feb 2025 20:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	65ZKk2GtEBap0WC6JfQnvOCcYk0q6mp1fm75hAwKexE=; b=L+cEEI41C6nWNjyv
	x3fE+tlVbbb1p6Qn/6V/hxl/wNoyArBMgKbJPPbfVEQq+jgfI8bADBOjsP8DPFVj
	6mdOXo1i26JUOCe3akULpU3cnUlQAGO1VV7OMS3xdfZYRC8WacaOp63oqDhvSk0+
	3EFRGZ86ccJfmJ/1cckB6ats39mRFy1Cs4DKSFqrSLAZCp1eU1kGpPg/wvsiVrmd
	QbN1oZ5xIb2apWMxgMpLNKsmAHU2/QquJ2nRpqd1x4GpaZyeYlRsNtifNlFRloL4
	ADeTOYfGHraIn4T5yy5jtWd97LpB4YVizyIFzfylEBDLtq42XxF3PzpdIMJEGImU
	dozm6g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y65xxean-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 24 Feb 2025 20:25:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e65862f4e0so7144366d6.2
        for <phone-devel@vger.kernel.org>; Mon, 24 Feb 2025 12:25:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740428758; x=1741033558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=65ZKk2GtEBap0WC6JfQnvOCcYk0q6mp1fm75hAwKexE=;
        b=rSJbuX9hVsLdT1tBCZp7i9g32GLMl6AG7scxXV5+hk9dcamFM3U5W33agmLpPlRDVf
         txLRPOZpSk2v4rf5URVKxDrvrGIio4ceoAYDyiijG7NnI5Q9Pd/Hu/Zqq7JzZ5G7eck1
         fPMNEmit+aO3M91p2QUzNvLpPmaJEO7iCl103cGFlp5Dgy4xtt8uccs14kUyO07S/2O+
         wsUYasskpMr90o2kG0p2Y92CUA9JZtz2KeWo06KiDm9U4slf9XX+U4TL+6Bfh/mKHV6M
         StDBv1ngZ6npx4pV6spATeBdoCcoMoqfNIrVJlgY3f1RVeK8gvGE0/UoMQRfXB3CZup3
         tW9g==
X-Forwarded-Encrypted: i=1; AJvYcCUHfoUbBX4Qnbz4AP78fB500GwttpXLsNXMWDVd6SuqmhYr6O8IQcLuFoMHVL0ZNC9CSGoOQIveCmckww==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeZe82TAfAdLi6ehwMcCZFH9AmKQ3l8mXatYo4ir+M5qFVNerU
	E/2Z5opCdZgWBA6R/PjIPFoUBtazsr7Cgb6BiLxJ1ywpaiFpQAiQPu9jrBL+4lUEMYzUHqD//R3
	/NL4lDS1jYLvPB+2+DSyKSZZhAwNumsbbAOecPsvgSAV2yh8K0YxC0mWN6CXbfw==
X-Gm-Gg: ASbGncvOyxEbMls9kVOgU6crOdBbpP/Rgk/TA587/ZrxTCjT+h3CwNtOHinOMZGFnxo
	5UJv2XWTQZ32r0J1nJRXZGTQW9wQ3nxRNxGhBpbW6ZXBn1IImCJKox1DMBpprlwIEw1uFaSoCvZ
	9nnEkGRf5l5Py+6mgz2ELKE/bq6tg4vwtShvssrlLj1OCdvhZZ2UbJVtX/cL5Jxvg/U5Kl15Qh/
	pB8flbIS4X9OlNQYZ6DyLqC4lWSHcCOFfY2aPZTUKzXf3Fk8UdOCI9Ql5kEEWnoPQqHhEa4WEDb
	Z/WWAN2cujG0YdiL0qlkRP+6bs6n9+canMWnxQ2N1vC6jQhOrQfuAa7NVkaRBMO4wOpDkw==
X-Received: by 2002:ad4:594d:0:b0:6e6:5d69:ec2f with SMTP id 6a1803df08f44-6e6ae9d2e05mr63774596d6.8.1740428758382;
        Mon, 24 Feb 2025 12:25:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfKUxFcIDY7voAldnprBxDRpcJ8vSl3Q4jTMO+GbQSLIoMZ1VG0lqyLwhpCWUnpAzTaWApvQ==
X-Received: by 2002:ad4:594d:0:b0:6e6:5d69:ec2f with SMTP id 6a1803df08f44-6e6ae9d2e05mr63774336d6.8.1740428757890;
        Mon, 24 Feb 2025 12:25:57 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1da1c2dsm17830366b.77.2025.02.24.12.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 12:25:57 -0800 (PST)
Message-ID: <6fe42573-7e98-47d1-8815-c11d44671395@oss.qualcomm.com>
Date: Mon, 24 Feb 2025 21:25:54 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sdm632-fairphone-fp3: Enable
 display and GPU
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
 <20250222-fp3-display-v1-4-ccd812e16952@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250222-fp3-display-v1-4-ccd812e16952@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fbPgiXEJRRiDKCJM_tFdkgjHpm9sHCMl
X-Proofpoint-ORIG-GUID: fbPgiXEJRRiDKCJM_tFdkgjHpm9sHCMl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_10,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240129

On 22.02.2025 6:58 PM, Luca Weiss wrote:
> Add the description for the display panel found on this phone.
> Unfortunately the LCDB module on PMI632 isn't yet supported upstream so
> we need to use a dummy regulator-fixed in the meantime.
> 
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
