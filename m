Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E01F25A631
	for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 09:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758792052; cv=none; b=k0zMvxqioote8IoKRTsDLmAx+V2cRLoUB2En68S1XgohA8isyz6KqXKux7DZoNi7/V4kCzsAckXBhQBjrWLU3My+jGEaElCFequlNAspi5u1k6BCTriIdOIlMFxvH7ZNAJtCGQXctB4JI8iLbd5BE4Q5ekADXtS7YXmURNL/KI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758792052; c=relaxed/simple;
	bh=rRSNO0HrYXDp9U7u3xqD9uyslqRK9KBJ8DGC+QY73uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BhYQJb5SwuQt3llT+gkI4dE7bTG3vFIYW9v7R6narGxNYBkqXYHh6CvssnAz5tXT6HPe7DYb1uiJDDyCTqKr3mu5EV6ge/ROfo6HIX+Kn8GHtkgePpe5t76KznJ/AUGc0iOx3U6UKEbVwzrhEOQz1CPue346wL3k2ZQx/Yaoe2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owxgzDMu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owxgzDMu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1J5A7002652
	for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 09:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J03QPepsogPpGOX5Hp1cEWYgqtb4aYw0wehT27zRwhc=; b=owxgzDMu2Fk3akuO
	VePtbRXRjuHYx2ZWq/g6KNqV8mw7XOy+F2Q1I9PSKa9njAGhk3dyhLcO9/GlR6Aw
	fj69wBCMRkyajcj6HJrInkarA9M0wKRSSpwU0dAVkXlymSVvzd6ReYrM9YJ0ePKa
	EcF4DuFYcLcQniD5DhSjB34AnRsnXa3s3GXM0OpcQ/oxRczgzjrSWqiBMpqlTlXN
	ePkl2Kvkp82f5ZcZnAkhc8LDNlhAuQoZhKO2eHWWjZT2MrxFHDyX/0zGhb54QmlZ
	hrM3xM1q0MHlSmdWKo6nSJSqzEHD+pbCAN2xOAapiB93m2P9fAtEzqIBjL0UJqVN
	E7QGEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf2309-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 09:20:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-85696c12803so32764585a.2
        for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 02:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758792048; x=1759396848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J03QPepsogPpGOX5Hp1cEWYgqtb4aYw0wehT27zRwhc=;
        b=VCaR0Vuip8gvM2/smnjUf2j0OlHNtTgMaNHXsQDXfkbHo+9DDiEjbKUOkua/76C8cl
         ZfO5jvdRNjU/NNRPYYuteZ8OZeU+QZXl67512uRDkkwFsRwNu0ibTBk6goHv8OHt2uWY
         SmBX+TZ//zaLsQhA/pZHYuWsHwiRP5ip8R9p9wZgO/zBLR2iVRCwRmWyKxjtrWFA1ZGF
         QAVk7PH28kkns+jQ0kzrY0a79+v0AlnR7kM3gQjbrSFSKq5kLloULA6xsAW/zRuIlhRb
         WzJxnQRNqk6jc28OBao5039+SG9NmkAA/BOEaUbfbEIrVBLiLDSTfe2LMWkM37+q+hln
         sUUw==
X-Forwarded-Encrypted: i=1; AJvYcCW/D3LA6xv6xNF75XndWOyTbrcnosQ997SKejPY3eWF0LyM0rWXKt2S8eBRZZ4mb7sLtKhNhPP34M0T6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDisDi44c0lRCJ5sNp3FXr5Mg4kjRKdPjF1EIFeNv+60Uo7AR5
	DRDaNnUQUK7/Wf198jWCNp6O5nPDhrCs9eQIqRZRuiIacw7mPVYfhtSuURdowtALPbacBE5kIkH
	bULp1TTW8hqCfibPV9nVOcKT/ckQFvH4/usj6ATLkGpPgHMiLHSOGoALRjjrEqAdvVg==
X-Gm-Gg: ASbGnctU5TIuZWOlujMfZd9XfMjy1fm1ot34N4AcypfeFs6hVe2egjvJwm5K0aT51/4
	sV0xfy0aYHUjy1dQbCQoHHyWaCk5OHhfrEwX/6GR4Bo6IXB72kzNNmlIgDni8HnSJH1uJv19/6j
	7uqR9k0jE+lHNvCKkb/tgkbVSJKyp4fRRn5HKYA1o0RrUaWjeyOHFq83DLXxOJBRWMEh+QA0zHS
	3NTWKt+PnuURYLLfsjf2+4D6hExCvR3KmWUws34I780ffVV1tGjS5mj5rCi6uGqW0Y+RmtVTWBK
	3iVTqttq+La9C/kI2fcmZ/9loX2sm+opTXsoANL1Wkh/Ty1bnHR/LU4UC4yJklH4c9AZTg/4EpM
	4dZcXkhzM1p/vPjcNtvghNA==
X-Received: by 2002:a05:620a:2954:b0:80b:2e03:dc88 with SMTP id af79cd13be357-85adeb4da48mr256640585a.3.1758792048270;
        Thu, 25 Sep 2025 02:20:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxlKFEMgfLPnWUY+9AW+CoP7+beslOB5aFZUiExK3V8Ym0wfYrxR4gKAsXlJWjx7TSAIaVSg==
X-Received: by 2002:a05:620a:2954:b0:80b:2e03:dc88 with SMTP id af79cd13be357-85adeb4da48mr256636285a.3.1758792047678;
        Thu, 25 Sep 2025 02:20:47 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fcddf1sm129596366b.77.2025.09.25.02.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:20:47 -0700 (PDT)
Message-ID: <55ca6423-a27b-4ac0-9c36-ba20bf8172ee@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:20:44 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] arm64: dts: qcom: sdm845-oneplus: Describe panel vci
 and poc supplies
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
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
 <20250925-s6e3fc2x01-v1-3-9293016768f7@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-s6e3fc2x01-v1-3-9293016768f7@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MJGamvfJXza4qRezBYZWrzBoeWlrKV75
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d50971 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=CJSKMeR5ttdQttduZpoA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX+8YW/EZx+67W
 EyS60Yi/7fSkpE4978gNirCIVKSC6Em4LE7Qwf/RikNt+7EHOkvnbXpglw+fi6y7eBUAaNdnLrm
 Ao3J/kegkJRNNhm/ZJtwkCtClhky67rLgYYvQNnLk6CGkd+jR16GOjNrzlGVb8rZi9kJWyMhD3Y
 KwElS+MtJ2tEWjjJ45KjVutMt+VtoaNBBCMrUz87jUFltgGqUjsjkmIB2K+UOP1asPSUtt75ULr
 TqJLGeiSthl5cbvKLzk6Sexl+EgolWmhKm1Q6f+k5Ui1LKzSfC3BMpwR9BQFErjJE1quH2ftqHs
 +hBIIhgygcBGmDprO8SG9zjAsZtFodX4Cv18qJ94HmEbRxgeDPnJSkTApRSPGRf2myKEDC9dx7V
 iO9gowGP
X-Proofpoint-ORIG-GUID: MJGamvfJXza4qRezBYZWrzBoeWlrKV75
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

On 9/25/25 11:12 AM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> There are two additional supplies used by the panel, both are GPIO
> controlled and are left enabled by the bootloader for continuous splash.
> 
> Previously these were (incorrectly) modelled as pinctrl. Describe them
> properly so that the panel can control them.
> 
> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

You may want to add a pinctrl config for them, to ensure the
GPIOs are not in a funky state

Konrad
