Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B23521CC71
	for <phone-devel@vger.kernel.org>; Mon, 22 Dec 2025 09:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766394025; cv=none; b=i+SrIYF1TpL6mgvvz5dRkNJSS12yD0G/j21yenHBGs+2w+BF0ZFMOxNRK/yrnEwDog5npmo3QA7SkNcxUsN8kItr04Kii/ViWfB0ZWtObD7zBt2KomvsXffrbw+hCIzQE0EGxNQfcn6voRoD3N8vaTIMh9bEsWEFlAvSwnWGp/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766394025; c=relaxed/simple;
	bh=7nFTwrTwUwJOFwj1vqDygUH4PflUF4uOIMAqrK8X+tY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mo/ho8fibBdzNrbgNA+CUtfWHhGrs+6bkjvO1796ZhJxlkRiZraBwKCu6ypUKrkrHAVWs2sepkBh4JdAeVVHExHQOKqrbbBVwPvBHgWhhE/C3N0XBYtMXpe5NySBEl2uDHqXklRNshKwffhzqdo/Ntzc14IWhA+N0pbh7EB5CFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QhglG0sp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i49lVTL1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QhglG0sp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i49lVTL1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8CStY3756130
	for <phone-devel@vger.kernel.org>; Mon, 22 Dec 2025 09:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7dzW06QAIiAkc0UiQYlfxr0uMo7Khj7kqrWF0YPuD9k=; b=QhglG0spVm0QGZ1Q
	SZBd/YM34FpvT2X0InMZs1uuuAtN8Sb4WBPnDcJIcemDtm1jUWiLw+E/VKOpuPt3
	5xNPxP9BqYhEJ6N9HxQDlfm2zDM+jhXyGlg6wqjf+4p4LBzVUNjbc6uau2C1t5ox
	aK2z8xu5nKl4jH6qy9eOK26SH1O+50Ax7VHAbzbLVxxsapAkTtY/koq0PZJwekzT
	BiL1aAE5oYkDVOzdFav27lBIP4i/HNl0wmo70zSzunKQvPrcSMP1CE+ba4yIiW5P
	+j7oV7ARwpQrMeekK/5tcMCsSKEP2ejGW3JI3uCkrXKFba3Hm55f6HdZO2fpOcZs
	OkkfsQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru4d23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 22 Dec 2025 09:00:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f34c24e2cbso12568601cf.3
        for <phone-devel@vger.kernel.org>; Mon, 22 Dec 2025 01:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766394021; x=1766998821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7dzW06QAIiAkc0UiQYlfxr0uMo7Khj7kqrWF0YPuD9k=;
        b=i49lVTL16F3+StUisdAlEQBu7JL+IV9mpy9xZgpFnuWr2IYEVrBwmdn7LrUFjMD16/
         pMVRC+LYOTNQAtuAkJbCdfwc2J4SwB4Rki8LlCZcrlDiHkM7Eq5HXrOtlnR/lpivXqSM
         m/esUlNvW5XvmwZ036H/iJCk/3zm6uDf+Bo7bdQeRMP4lAxsugNpkUGnWTtihH5BJ3oK
         Z+Ihbd5CD2KEm9QWDo0zOSKJw2QIC/5UZW+dZ4lMXeBNAQQxW1TLIdWDAI8Zi9tW7oWw
         jQKVIHmK2f0pzAb29A9HeDG7Jmit0c5Oh9dxkWMTz7JoD3doQyzxQDfOBSOxQKbdBoE7
         4GAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766394021; x=1766998821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dzW06QAIiAkc0UiQYlfxr0uMo7Khj7kqrWF0YPuD9k=;
        b=WPPTu7hFLpXHBcP5yOvjkW/YeOIp5uZJRDUMjc6byi+juVpLo+YuWiQThMpUD205E0
         cOcD3hpQV+GjWj5laaNtD0Q4b++NdTYdMFPdSAWbGUuKFE7iYTcmMR6ztZ35W7s6ex+8
         c9HgP+7KDIkbn15bdKmb8j1Mwxs/hIxuPbxkvcypNJknjXHCumFbGI6lfHYd8pql84xB
         Mnn3MQdD1OhQk8giXVph46o56QYOJAFU3BNhtVQXSTriEZnIkG/IgefQhRGYPqyqGbNS
         c/GDIwgIKDHpmltyKGxt1DgqGrLvpzLzgQ0JQ8veXeQFLVFSrP+80KS59q8pSsh4OCEY
         ykug==
X-Forwarded-Encrypted: i=1; AJvYcCVmThmIXEXzLsaG4Mvs9XSjFtyio4OsX3W03Uj25F8Rbjk5fo8taLxMayMG3hV0EZusHKlZCBc8iHV6LA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZm6U1bgu5gItcFaeeTsXSuKio1HeB6iztzi4aEZ57Ld76awPm
	JRhF7sMGwykuuIUaQp51YxMSDbAHW+6+vE9ICp/0m7fruNKOxxAgBbr+Xx7K0iCmH8pn1mk/Lye
	tv59EkLpBLqwLHRVGMHt0DJlJXj+3bFri03bQuu38FaZMoCSsquQr/DEc4yWZfmpT0w==
X-Gm-Gg: AY/fxX7ExqpRXOVko06ZGFjEKxnzX45zrzPbhVK2cO41tOX0RmphczyHfHmNJs0OYxP
	TWv5vinv6FSt5gDj8mj/93T27A8aNn+LW3HCgq54DIJVbAnriocBshGoFHtS4MQY6ch0C5rsjoT
	bRuECjD2owqCdkxYAHssMmHQgR/EVSH2p5UapokIzl7fylN9iDYLwuizjThxz/nRskiB00v2CIK
	quO7p+CnSTJOMnsLWyAKYfJsfHPXGGza0EDmXpD9k3rThovEJEigQHYeJ9yPfVttsI0L0HWCYKR
	zG+h2pu5PHDA+f4sqa618MQ8tWC7tH6HBFR4MLchUv+l8rHUbS5ju0SbWgmqXPGWJt8N6vMQ/on
	jUTG4650qD8dTiz6k9hh2zb/AnyptMvT0lRAYn18Xx76UUl7aV9/vvXrbEijCz8IBdg==
X-Received: by 2002:a05:622a:290:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4f4abde8b40mr126853061cf.11.1766394020889;
        Mon, 22 Dec 2025 01:00:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJ3sa2cwix8pdUL8luSbRZkdo1cW7juRVDsscaa4ncFyVB+MukCKD119lgajVKKUHQrCA2Sw==
X-Received: by 2002:a05:622a:290:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4f4abde8b40mr126852221cf.11.1766394020083;
        Mon, 22 Dec 2025 01:00:20 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0cc52sm1005945566b.52.2025.12.22.01.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 01:00:19 -0800 (PST)
Message-ID: <0d442547-db12-4408-a0cb-b3d2bbc723d6@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:00:16 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/6] soc: qcom: ubwc: Add config for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-1-4537a916bdf9@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219-milos-mdss-v1-1-4537a916bdf9@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MSBTYWx0ZWRfX6GQD6HgIlvI/
 6wr6RFInQ1R8N5qdIS8tcxE87JyzmpG1otOpsyo5S3Smp72iv50wGHiog0wBc4BAlXUmZfa3YH4
 WqLAvUknn22GyGE3XWJvW5RinIj2cgLpeVHSdKlvH4iwuYPJses9DUqzyxx7tZFxDHR5ARQ6sOn
 vJnqU2YZjzrXgj7sqivHzwUgMC5Ip8b5WoywE90q1r8xrFi8sV91dW5sOUhbEsiatU5LsyszUel
 RXh9no+HKQHyYj8f67IOLvzrxF/MeFAdSub1rj/fAcjWZLpLE/KxAof8kRH+qL5Bzy9lNEdvOlu
 OusQUEVJhKtPvrL74A9+2GXYdxtVFpt7EAEv+RuRvRD9D/M06VH9JhxwS+JJXs/d3Cl0lm/5clM
 68cEFQceoFhtIcfylmJC2D3XzaY2laQ2Au8kSPyd3ajF5bTWiZ7axNzKbjsYDuK0SWAF6HdSlvw
 Ly52sIsac9drqEIwmGQ==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=694908a6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=KB0s8L93-oSB63ZrkccA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: ik-rmEaZKgoiuURvTYkbcJOXda6WoaOY
X-Proofpoint-GUID: ik-rmEaZKgoiuURvTYkbcJOXda6WoaOY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220081

On 12/19/25 5:41 PM, Luca Weiss wrote:
> Describe the Universal Bandwidth Compression (UBWC) configuration
> for the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
