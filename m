Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992A11A840F
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 09:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687399; cv=none; b=snlETpRsWMjsgWn+ypFM88Qac6qDYWAQH91amy58NxoWiysf2NaV88eWIvIOzYwHPn6Nvh99uJ2DaR2IqWYgpahShW/w//f3WqeFtTrWam7bqvP7yheAavOT1zmcFBoeTdlHWhwwodhDjjpbpl6V1eyBnyzxmIJhQzqY7gZnt1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687399; c=relaxed/simple;
	bh=sDdFiDa5rwkAIlrLyHaCtQbwf1RknOw9hv324X9pEmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DGdjuU+wrrR30zCP6X/Mw8/Y0Sg8cs44d8/0Y3HkmtUaUAdGOwsTp9v6a9WZvpWoHUr/D+t9omJkNjzRaBbYSmtU2ToM0eCqU9J9zJ4ye5LXgfvwNomlRBQE4HRCkNiO7KJnA6DNeGykn9SIO7eNVdWSHHbbZzPKLiTJBn6sY+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iNSz0FZG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNSz0FZG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK7Lq4u028669
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 09:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h7oj8R8h4E4EYHPxhiDSmNCuo81TupGOmdcttJnlWpc=; b=iNSz0FZG1YcH+8Dw
	Fl7dIoV3u55itHDXeQ/Rc/8pxNsdkFfk017S28+nVtF1DExqv18EKqjzKc+1ODp0
	eUbzE7rscXa8ba8Val7f6TIck7dvHazIZuj/7Ce+HpCD58GcyVt+UqOkphAK8oof
	MNsmMj9u68hUMsWm+IvriMmdFerpfiC/0ewFhClMdBzHgZD3Opch4KSPUcK5pNMX
	A96SiZdeqnvUHDBiYuPtubLhFvnam/nRmgzuSrb8NyV/LxeIWnF+4BiTOELSFIN1
	t6lOI9OLzNBU8q0M9xVxQuMePLRxsrOHGRK9oFAmwfihq6BciWecmfzdWyubIJTW
	JHnpuA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n44hrd1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 09:36:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d88fe63f21so4152386d6.3
        for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 01:36:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734687395; x=1735292195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h7oj8R8h4E4EYHPxhiDSmNCuo81TupGOmdcttJnlWpc=;
        b=ReMNl0vDI4eTrrBIc/oTrUQ8X4rDwZpYYGMECXefSi8fjF6VXEG1rXtN6edPBrmHuK
         sSfEtjOnWv4GRVbr1i8ITkXBPdaVMZGbp8IZ9/HC86p9I46K1UPGqDFzi+I6B0wGK5r5
         FFgdXdV8hGFRlybpZILsCv0aKfnnwdV5WX608U2qXgFahtpkqdlzetL9xZ24aedxYL02
         yaa/a5g18y+OKC8iS6+iHW81s8zxG0VX4HWX4zNeM6pfj1eORThpGd+ijnYbhNtJKqDa
         sYgGfRw74gHqvYtT7/6qUyuFdKFxVudmsK2sPZqtcDkSfSx7JIBle/dGh2/BZA/lhYbz
         UgYA==
X-Forwarded-Encrypted: i=1; AJvYcCVqApkdU+gk+FalQIWeELyzBK4fRKhZmDH+ZqSaG1zrj0so6uR4FECPYc9dvf8ERbmVelOS0+odQ/KCEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFe0cefW5We3BBhN4jTU4SgizlSF2grKYwRN93MwdiMS3q9rHj
	5F6imXD6wgj7vYYNacbAC+Tluq3FcPq6pMihQAb5GSJ03wWqMAPygu/fnWTikxo900sdIhJGDMV
	rJ4D3HOVjxzDlOg9DmV9h5KMo/uCP+piapsNjdxowgrqsD+lw+OYOaiVwS1gj4w==
X-Gm-Gg: ASbGnct00ltOJWF1IvitH7Nnw+OgJnFHe2JSDIDcLRbK4VtYa+qhsoj2cqQJe/hIvCA
	/vEY9E3trBXJ1OIAwQahC67dH41dA2yOWykbSBzTw02Uv93cfqnadtkLBMKc+b8siMNHk71uXM9
	dqShnkbvvCPkg8K/ynHI7FAvm1x72OYRk4EN7Rgt7Abqd5VVXcfjN+zTZtA/eK+T7KNuTxGy76x
	Om/m0kysXcKGwhLQgBibP3nKsmcRectWUtGPF/rHdEGG4J/VNLbtLLTNKQJN6u9mu3H7EakmdeQ
	6Mr6Q3PHisr/3sEdVGKGp31RHMPN8ycJKc4=
X-Received: by 2002:a05:6214:c21:b0:6d8:9a85:5b33 with SMTP id 6a1803df08f44-6dd233bafd1mr12002436d6.11.1734687395492;
        Fri, 20 Dec 2024 01:36:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoncBjB8cj/M7gA2nrgGGLaBphVRng7XSV8mU7QIm6l9QbtXTfOitLjiLlZGrB/N13wB8Lag==
X-Received: by 2002:a05:6214:c21:b0:6d8:9a85:5b33 with SMTP id 6a1803df08f44-6dd233bafd1mr12002376d6.11.1734687395116;
        Fri, 20 Dec 2024 01:36:35 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e830abfsm158492166b.20.2024.12.20.01.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:36:34 -0800 (PST)
Message-ID: <a536afc9-0837-46f9-9135-c220cde7f862@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 10:36:32 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Drop extra
 qcom,msm-id value
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241220-fp4-msm-id-v1-1-2b75af02032a@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220-fp4-msm-id-v1-1-2b75af02032a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: X5P8Ln1rDVAyhRrmeM8WL1JKNsX35oHm
X-Proofpoint-ORIG-GUID: X5P8Ln1rDVAyhRrmeM8WL1JKNsX35oHm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 mlxlogscore=977 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200079

On 20.12.2024 9:55 AM, Luca Weiss wrote:
> The ID 434 is for SM6350 while 459 is for SM7225. Fairphone 4 is only
> SM7225, so drop the unused 434 entry.
> 
> Fixes: 4cbea668767d ("arm64: dts: qcom: sm7225: Add device tree for Fairphone 4")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Completely dropping these values also appears to work when using
> boot.img header version 2, but doing this change now would mean any
> tooling in the wild for packaging up the boot.img using header v0 would
> stop producing working without adjusting that mkbootimg invocation.
> ---

It would be nice if you could start shifting that tooling to bootimgv2
slowly, and when it trickles down to appropriate places, switch it up
upstream as well. Of course if that works for you.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
