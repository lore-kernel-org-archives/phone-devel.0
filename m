Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E032D3EF5
	for <phone-devel@vger.kernel.org>; Thu,  9 Oct 2025 08:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759999960; cv=none; b=nUjtuFR9HhgmQDWJ+iBc6WDXY5R19bhPLtgPESf1aqtGN2ocvoUAljWGpY5bUEQYBvHhkRfP/siU0cGEKYRK58i6zblRzPpyAhxIbG6kHvespt9QeUNNqh2bTpa+qmrFxFirkONtMC51X57aWfQxrUmTrO+YCMuOEiFqznxfMYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759999960; c=relaxed/simple;
	bh=SvL6QwL2kbfoDMu7swIfDh31Z4SBAEEr16lTQLxGnf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DJ7+E4rBN0aHX3aZLTnPy3/KFKkI/yZRRXvMNw9yytgFRkqXfN4CZWkhj3d3KQxkXdyQIDITFlCslK6tewpu5akebWS9zAeYA66ql8WX7ne3o90gLulA+DOJx17z/vLOMaOA3NvaN+/iaQmcGLuN4p2ybuicOMVvuv3BpMWeYpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xrw+H4t2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xrw+H4t2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EK1I019192
	for <phone-devel@vger.kernel.org>; Thu, 9 Oct 2025 08:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mz3R/+d2HRB2j4ZAAYNbKPbcU1+9mJalbUWZyK8B4cM=; b=Xrw+H4t2gQxnEgFS
	dxv+K9WlSIoBBBrj/ny7tiQn2lGq3Y+40pV21TdG40PO0bvvblR5bscNgV8ZBOn0
	NR5ZYiWL8QWFoguVwfz/fuQfFrppThsY3Q6L0ubkm6qsz5BlViVelyt6shk7GNjg
	avD6M4JFFF5Q7ZU3EEXJ3AI/QwJ9mtGweAHnTnft2xYkzftNm04PoQN2Jnbs0dtB
	PiXMI2iiKa+pVEaaVykHgKIiFJpoNi3Gq+3SzjvHtA0bqUvBQ6RsfKL74sJvSRbc
	AYFN1sIRcanio+cS6t5fRfrGcpOXBkpeoFpQ5OX2bXJdDG/WoLXi/SwnFEPSGQLv
	HNQbAw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nt3rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 08:52:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e231785cc3so3854291cf.1
        for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 01:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759999957; x=1760604757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mz3R/+d2HRB2j4ZAAYNbKPbcU1+9mJalbUWZyK8B4cM=;
        b=bCAItHmtPzRGTXjHy+HPDeyf1OBilllaDpY+658qDdBtz8xwKOfI+GCQ70yPmQwiGY
         00IsINRQCKznDDwIJ+LNRxRCHrzLPGoMJTdZtWuypSX78BxLTjknUe3dt1kIuBO+FxFC
         9G9dbqZ/tzNx9JN459iHoayOhurH1JcQXaXui1QHXvnOe7RSCNxyGURXZE/aTNyx8TJP
         VEJStNVIfB6FnSLm0ZMUBgK3DLVtztePHa7acbS5/QZZIDrJQhIQa12p06FozlQIQXxh
         OgeuRKOhwYXuzuvz3xVARDuGXFLOiWCJboFXCmuyL/n4UjoUqtk2MHvmBzORy2taHKew
         t6rg==
X-Forwarded-Encrypted: i=1; AJvYcCWB+U8hCQkfUUzqxUY5ZlXPqMkgy//bEFWu3g1iyjYGT0QTS/ZIOzxkXiIdjN7CuuXKvgMW78VC4Njr0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCPU4436RHqYNvJVY3EY+af05GxmIy1jwV5cZ3J0CPuOjsVXcC
	3jGBzn3tJQ6oVUexYXYwUoJ/CNa4mUhg0+tniV/6NwtQ6N23642UqIietzoaq5YaGcWfdkkbicl
	SjCM+j39Ju2cu1smLb4wZZf7Y609h5/qgn96mWJcaxFtHuv4lYpf+4fmcm0fGUOyWjA==
X-Gm-Gg: ASbGncvxvxS9YVOyNfZwYzlvW8TAuD7Looya+1VPMb5sN+QIYfyUOC1EYITHxfdFOBs
	eBU62IWFgjrGu/sxCBlcsqhBhK4dZj9aNAy9QGfce80Fu/MByeRFtTi3Xoe2sAHEg4eTt99G5T/
	6bHAzTE5I5F0tra/4lOknjfux8EoUUf/qPtT25oXdSr+gv6t6GekGqe8ZBS9aGtdfxZfbTGrur9
	NZHeq/729VkBvdXRLd6vnyKU5Tb7AWhoFUXgQS85yhwJIBaRLM13TsSTz+/95530LdEkKeQ7Cy3
	aF0TKjB0uLhFFO8wZlOWkmmM5c7uyjTsq0eKyErlfEqoMBLz6FCrqpnU/Hoh8zg6THaXad/2Jak
	Coqogjtd9o7uZsq+HkpK4LJSSDoY=
X-Received: by 2002:ac8:5fc3:0:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4e6ead1deb0mr60152841cf.7.1759999957590;
        Thu, 09 Oct 2025 01:52:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt0uEiEbh1bGs1o55s5jlT8wv6t3qr229hu5kTSl6GIzd3si4d6C3k4g7aU0DhbZYlQXIyoQ==
X-Received: by 2002:ac8:5fc3:0:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4e6ead1deb0mr60152511cf.7.1759999956930;
        Thu, 09 Oct 2025 01:52:36 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9bfcsm1836499866b.17.2025.10.09.01.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 01:52:36 -0700 (PDT)
Message-ID: <3e115b9c-41b2-47c8-ac92-22969766ec3e@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 10:52:34 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/panel: Add Samsung S6E3FC2X01 DDIC with
 AMS641RW panel
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding
 <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-5-21eca1d5c289@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008-s6e3fc2x01-v2-5-21eca1d5c289@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: McQnTLKWBJi3PgiSZBMvWyI62IKtYy6d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXx82uEDs4CzBq
 +n90VFkQER+J4rHaxTHZU+bCwwGEnZ79Tu/3pXZsCgv8FDTUzj+Sl0a+fy1v3S+Iwr2ME9srBsh
 JEihHpIvhBJ2xeBhkiqndhmPkvtv7Rr1vXdvKJljFh3uea6NSSL8idlGkuZCBnyyJDL1qjeQGAs
 c9iMsVZ5ip2SI++U1lmeUsJmHOieYG5H2PZZDVa537tculpSjXbW4gm8vw0c/4iWEwbS6sfeVEm
 DhR9EbNbvHntiwoS2GTlbZ5bOBWqtExkaV3rpg5UayFfgnVm/Ul8PV0YvhMkLMHpxTOjieOxvC/
 cZptVFluYOTA5d7paiun9ou23tmZa/UrEe4l1UuIOFJNU2FK1jL98sZf3tq7m2rI0NDnkwtIkAF
 jQonSkAQYIz4m63tBdp0fVOjhcE85Q==
X-Proofpoint-GUID: McQnTLKWBJi3PgiSZBMvWyI62IKtYy6d
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e777d6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=WFa1dZBpAAAA:8 a=bBqXziUQAAAA:8
 a=cYgmbtr1Y_meZTC9yNIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=MZguhEFr_PtxzKXayD1K:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/8/25 4:05 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add panel driver used in the OnePlus 6T.
> 
> No datasheet, based mostly on EDK2 init sequence and the downstream driver.
> 
> Based on work of:
>   Casey Connolly <casey@connolly.tech>
>   Joel Selvaraj <foss@joelselvaraj.com>
>   Nia Espera <a5b6@riseup.net>
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> +	/*  This panel needs the high and low bytes swapped
> +	 *  for the brightness value
> +	 */
> +	brightness = __swab16(brightness);
> +
> +	err = mipi_dsi_dcs_set_display_brightness(dsi, brightness);

mipi_dsi_dcs_set_display_brightness_large()

Konrad
