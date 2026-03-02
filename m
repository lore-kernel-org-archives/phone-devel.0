Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A31635AC16
	for <phone-devel@vger.kernel.org>; Mon,  2 Mar 2026 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449690; cv=none; b=GbXIxm3U8/ozp2Jv7Wcp0D1d1uUlPQSYnQTiNMdB4dgutpumEz9TFhRXqAq4AmE/ZjeyHVyKM+XmgvV6e6VQOObjd6Y0Y7xhzEggoAnN/YJpQZV9rRoPICwCa4FLoK3Xl67mQFDt4AZcG5bk4ncB6gAleOi5iMUqy/sEFQ3ejEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449690; c=relaxed/simple;
	bh=ohirexlvJUGgcHbY4zgWG+elD++b58Hf0P7LJUQ8Y54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X2CMUg6jP++UqkUKuQT48imWoy0JwP1ObSv0W7iS6DxUSYSXxJu8nwVRCIq2UYNpsxiuehbqQZ1WlTXikizKkSoqcYBYaTblLiOpDrq7+RgM2WEK752uZAF/WgBqdkeChO7Mbe+oBvaSWKKS7fXSVHsn6nWdiPHrAtTiAl5x7cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i+EaCYB+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KWaLd7o1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i+EaCYB+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KWaLd7o1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6227maE6055870
	for <phone-devel@vger.kernel.org>; Mon, 2 Mar 2026 11:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8WMaQAPAGqlWRuoGlxHXE/B8+bDqLpmyBPFeYmr+uyw=; b=i+EaCYB+r8cTGvGz
	oe8BN0j7x/YK9dVjVyAMDTUE8Rf6crtaaENULqbA0k5zR6+W8Iu/NIdwqj7cP5/O
	PXC2dxSt7ySvpg+wO7M0PVFhVc/mJZaaBcyyJRnyzXGKnlbLC63HniEhRZNsEibM
	gof/b6125DJxJGviQfiMdYXJyj6Pp+5GRGyis5/yEgbCw1Ms3W+9fkrMhXpHIll9
	w8uRUoXdAnAAopASoEW3gU2HZOxyjYIQZZunb1nqtb5UVXw+C7d/0ZvhqqFkTlqk
	1MnFSWK7zUCwIcWRRMBPbZT6t1sj/O2fN3xZCdxhG2zXZt+oEL4mwUrmTT0iAde2
	pRsWJQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw64a3g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 02 Mar 2026 11:08:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4025302aso377967485a.3
        for <phone-devel@vger.kernel.org>; Mon, 02 Mar 2026 03:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772449687; x=1773054487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8WMaQAPAGqlWRuoGlxHXE/B8+bDqLpmyBPFeYmr+uyw=;
        b=KWaLd7o1QenpJfAdXlfKGJBFV5j5e/Ki/m1b4uCLLr2aiNf+bmGGFHE5ggG8XLI4iz
         MC34LHKdlTebrf7vpIW1IcCvgXt/mTz3Na+zwPIuWkkCdNdN4foDr1m3+VBDXleSB/yV
         j1fbPQuS9dvPHJQ4SydDfFeI81OeU/hsevzaC2Wfl2euE2sagYxfyZtErmRWYXw1gIku
         Rresg19/Sy4jhUohB9bxAuNsWRKiAJul5guNCMapfUt7JIEVwgFPTSFs3nTZjIMOGPDT
         qbRC5ThDUtnF27fOcjTqHoix7E7YQ5F8lTGXCH50Yj7Herd3GMMSwbEMljiZgJRzOnF8
         RQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449687; x=1773054487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WMaQAPAGqlWRuoGlxHXE/B8+bDqLpmyBPFeYmr+uyw=;
        b=eYGs+xPWq3deMPVh5dyPKCQddU7C3jqmdsHK2ze/5sn1g3uJrTvnTOEjWxtMggqHOB
         ccQAknVHa7FJvwlnVncn8yzFomYfvZ9QAJ6AFz+L3z6hh3Nb2pW5NNblizFq0IXRGOKK
         EUZ9DAqZcuofianc7WU5lFHbNCMyLKSaaJHsCiNCdPTN9PUzxAoNmwixKkknUkI6ggbS
         1aRaCB7CoJiDpgfOBZj+hDLGvQEwHIZqW9OmxsGnWhT+XD5Kh0SVgNqpK225AWsHNLLZ
         wybp+xgjMo+ae8pqHd99AcgZC41anG+6/Xlr/AlJdlzocdVCswzoUjSyfChgOKVZJQsP
         a0nQ==
X-Forwarded-Encrypted: i=1; AJvYcCX66s3gVWbsv0KCKF/4HeH7M2ed0pvZwGLZHx39CyiFLdHKnlo+fIfdILb1GeXu3/l3Txdq6qoJK2bXEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg6VBVpgqCc1kJJL7k2MD38gZ+9On04XY/qz94PcPuioIKRvqO
	HNAtjXKttvDo61Ur6QdPoHXnLoXJksb8C/wK212Tyc6MVCBNiJux6Bc2aT7LLcnYNqr74ZRPJh3
	Wde+b7nT+asvjRi10545KoTzIKjfFAcOLk4J6ueXQx+dtO/okSV116AFIfxpwTbumIg==
X-Gm-Gg: ATEYQzwC8QTYTag0KciwPEuEKxj+cU6aKofJO3m5UB75crSSEUF/SSY38woEvaCJvcK
	p72G7vCEjcwqV6JsA5lf19YHHxas5G/28fUJQpUUoV8B3jFwzfICZFUN8OJFaHTlud8AGjVWZLP
	lkOF9lsZQ4657xHVk1xDgu8lbbcSHza5Nqm13Cqj6JpQV45gdNTncmswhCWUldYDohisR6ulCb8
	oB/RLs4M1CQBctLw1pQ38XaL6gY7B0Z2W7GL0u8hGsA8fN7Ugx5USYuq6viGQoIYbAwiyPtptxd
	UHvuk3Kb3soxJJiQfgHoowKIMQym7C0gaxBMdKK/XX63axyFAWwsM0h5BaYhU/Ix+ilYt7vnPOc
	eew56qtiwCARej0Mcwm1isno7RQ0u7SRd49BHOrpP4JpQodhFudarvmZr74OuDeZeGiVMYT5OAx
	bUDAI=
X-Received: by 2002:a05:620a:2901:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8cbc8e44e19mr1221647285a.2.1772449686828;
        Mon, 02 Mar 2026 03:08:06 -0800 (PST)
X-Received: by 2002:a05:620a:2901:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8cbc8e44e19mr1221644985a.2.1772449686402;
        Mon, 02 Mar 2026 03:08:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd4695bsm3425919a12.12.2026.03.02.03.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 03:08:05 -0800 (PST)
Message-ID: <9ffc0460-e394-4f18-aed2-ad8a0b3d1b8f@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 12:08:03 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add
 initial devicetree
To: adamp@posteo.de, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260301-wiko-chuppito-v3-0-9b36a2a7aed5@posteo.de>
 <20260301-wiko-chuppito-v3-3-9b36a2a7aed5@posteo.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260301-wiko-chuppito-v3-3-9b36a2a7aed5@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dx_NKxFr6J09GLf5j6AUitOIo1glelJV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5MiBTYWx0ZWRfX+TJXwRYm8qYL
 V+3z57V18x4/moL/+d6RodpZukvG+vFyop2cVgckjB78vFVLzt4XbCxLUX8JNwfPw+882xgmrRn
 ZglerU/YH4WiSQi2hs6mCrDcTshIfrBJPSbiRc3DYHZmksKi3RrLjnqPvM7IjMSFAPbkZaGiNnV
 O1DeCPhbovE4uVIIZomGJf5+u6thowNHGCQdl+RxcFLxmnYTRXB0VVVqwVU69R/mH4Egbl4sUy9
 fFh7Yt4yvwSZqDmWObg2KHBr1dIqGvMut+9mmnDaykDlCi740Aa0sIF1UcPEGIxPJBFQOh6tEJS
 EtQs52Q0rEPooSRD+m/6eVHgjKJUjR+4jj+6JXasLCHgQFRyKZpGmVS5G//zN/feq0bgOzKMlKK
 iSPpsjqNe4l55bz9sexnqhKICUipmEqbzDbkjk6iHXM+O4W8F8ndJbpBJbGT/HzxLP+Mx0Xi90r
 kfQlmBN5wEQCyDMfNUw==
X-Proofpoint-ORIG-GUID: dx_NKxFr6J09GLf5j6AUitOIo1glelJV
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a56f97 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KWnYlBp6PD3PWr4rMV8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020092

On 3/1/26 11:29 PM, Paul Adam via B4 Relay wrote:
> From: Paul Adam <adamp@posteo.de>
> 
> Add an initial device tree for Wiko PULP 4G.
> Includes support for:
> - UART
> - USB (no OTG)
> - Internal storage
> - MicroSD
> - Volume keys + Power button
> - Touchscreen
> - Backlight
> - Accelerometer: Invensense MPU6880
> - Magnetometer: Asahi Kasei AK09911
> - Hall sensor: Rohm BU52021HFV
> - Proximity sensor
> - Vibrator
> - Earpiece
> - Microphone 1
> - Headphones
> - Wifi
> - Bluetooth
> - GPU
> 
> Signed-off-by: Paul Adam <adamp@posteo.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
