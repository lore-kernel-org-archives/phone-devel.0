Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1598F3659E9
	for <phone-devel@vger.kernel.org>; Tue, 16 Dec 2025 12:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887042; cv=none; b=bRx7J1Jm2MITvS2j4GxbAhU2Sp4I+uhNzboIj0xkSJ68extOUSil6cjokmmes+gWIktxe+t9oF9NsZdVltJl1xgztnpmL+s6BQ4GKFIG4NokjouAPLVVLh2ZEqrJFwvDZqyGqtYvyckTmA2u4M03z4uHGoBFBdFT36xURRdoLT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887042; c=relaxed/simple;
	bh=43+lAu4/5WmLdRsHNdpR7bsrhDMq2bxfywhBh5ZqLa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iG0VXlAGSkSFuHD9WakaASp1dIyTOTR+L8Z22rNtLTISjyfXGzEhj1Efh9k77G04J2e2nmi9CnDUpmmGuh4v5YCVx/CYKhFmqt/+S7lkpndA8RZxSH6zGDIlY/vvLgj6P+S8dlYvfn2TXk6n5Y1e7jrzYIQ2ODY3/OiImBb47ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TgRp9V1j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmhLe93j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TgRp9V1j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmhLe93j"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGBv4m52810365
	for <phone-devel@vger.kernel.org>; Tue, 16 Dec 2025 12:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0GTK982GZBp1GOR2TR2xUNEEQ8UbFyBdxOqqUYpfZow=; b=TgRp9V1jqvXgyh+c
	sje5tWDieAyC359I3DrQ5Oi8WmbCnzxelUTsShF8/sYkMl3f9TBrdjIOKozaDwVz
	xF9oazJOoWLldFq6QJnNVnMcaAnICg82F6VcdvhtGIuFPhXa+jIL701D5IhZRMd1
	XiA3H54UWaRBNtnAKaR8Ky76K31r9wpgUFCHmjlRsJ5zjaZArLsUJt6IGrd9/wdK
	zES5qOtAKbmBIsrxTqqoKdB9CZwLU6Z9p/8N/3ryWqubr9qfU2JzcJcJFEHNM1YV
	8yFP0yh0XrWwO24FaTxzDriW5EMzXKdefgJkejKwc0RhWCYM1eDRFK3oTCuR0xfc
	upwANw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b32gas8yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 16 Dec 2025 12:10:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f350a08774so24871cf.0
        for <phone-devel@vger.kernel.org>; Tue, 16 Dec 2025 04:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765887039; x=1766491839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0GTK982GZBp1GOR2TR2xUNEEQ8UbFyBdxOqqUYpfZow=;
        b=bmhLe93jFGL/u6yU0s6eEoRNKrDA44/QA9xsD72PGA3wuv/fRrY2tHx2IQ4rHxLEpr
         u1xUqVj0j+pw8RssN62XZ1lAzGdGljCA6RhLHHielO+RgpYUMcy8yobMYA9UItcZPtKL
         TZf8A+dKNTWjrsuQM6VVm2VRfuvIxh6jTJrzD5mSIfoMWlm9E8DgZChIJltaiB0LLdK/
         ws9ztwA87v+myvZ0vzVF5147rI2PYVMvWxw5A0iNz6rMXZOZWspxzJZydRL55SdtSBLc
         vOGfG2TSJ/Y8uZlfO2BLS5f1sFpBXZGb7+9kZsPHS+HjDuW7/804QK8yoEmrdYIp9alf
         bRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765887039; x=1766491839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0GTK982GZBp1GOR2TR2xUNEEQ8UbFyBdxOqqUYpfZow=;
        b=dbm+bvITFZaJ42JL6Dj5SdZWZS/M+ZP5aPsq2oY96ZL8ojv2snIjw9NMwTmiRrKDSN
         Wn6BgfhxSvpOxoPCZLA6k/0tBa2MEfSXUKAMyJYh9zlK8jsb2D26gyQZTwjgIxSZOCfw
         YPGFmcaQg00j0Sk/a2pSciP1Q/dbh6AMOTlS7vphHEUQUO+vrc4bcMIPt6OF18o7zEzB
         gYhXCymqCNZYnYaaSSGgtpuWfdz5Q6wygw7CiFPZBTReT30Sdcs/gPRKu6Q6jgxnup6O
         pRBFNgfgFt1XmLV2F+sqfdbjqYxNDX9tAdO8h+AjnyIQ2Q4w84Xq6qILuamFh5wA/o/S
         lNiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaktau3q2+qim8FkVpts5hzQMUirocP2+RFw0jwZqrAOtAHjOqHzaElW1Fz8zph8e631vn/VvpL++ExA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztKjLcjo4sYo25MCCQTFJG8/dAYdxTpcoBFbrDnIv8vXaktOFH
	u6jpjbOobFMB7ywuB2+T0bL7czM9jmiACfCrRimRYEdolA4vcIcRwuqcbQG7HZvSi3amHuU7VLJ
	Wq6t62qfOiNP+RsspJ1vsmvvMl/tYjbjGfjWJ9BYUUa4vO9cwzMEfmpeRWK6JA0hVdg==
X-Gm-Gg: AY/fxX5B9o06l2pVFGCpzYTe5NSSy8hwy+Slk/du5QK48xajZs4506qEZJRvhtRzqVM
	EpPqZfI8ucFjzyrzJRaMVZuoX9mI6g4CyUQtKf96YiWMyRzkweXfxrnB8ipqh4lWMrcF+QSN1hg
	7HhWnzhbKyLJ8DtAmsaM5ZY9WIRDvaOyTHLEyfK2pMMfJ7+Hi+uI1GJsFU/Fs4l8rCP7EWytlUQ
	+5YfT4jucAH4W2sz687GebRkyO4YI5K6uz57k87rRxP2SRt2DwfxHecu7Cd0Q9OBoG9kQNV/dsm
	IOXeygGcLmQzqRnFOWNZfJ83iHjVzjlHcAqkh04NATyIsvpVc8OFfIOR9mqpfxqCEf+y0wtH9mA
	OuTBITGs93eUvOGv0rmwuvKR5KuwCQCZbHz+rAn2Ji/QDrTiJ+vWD/N+kPCGQHmFqIA==
X-Received: by 2002:a05:622a:1347:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4f1d047bbb4mr152409601cf.1.1765887039297;
        Tue, 16 Dec 2025 04:10:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5SKyHqraDstQKYfG+VACVomM10/dBkE94VnGiSDuFI8KaBQVrShZgqcZyy8XV2Gy0HK5RbA==
X-Received: by 2002:a05:622a:1347:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4f1d047bbb4mr152409101cf.1.1765887038712;
        Tue, 16 Dec 2025 04:10:38 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29bea0sm1682686566b.8.2025.12.16.04.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 04:10:38 -0800 (PST)
Message-ID: <8612c8f6-659d-475a-85e7-4049586a5962@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 13:10:36 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Enable CCI
 pull-up
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
 <20251210-fp4-cam-prep-v1-4-0eacbff271ec@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251210-fp4-cam-prep-v1-4-0eacbff271ec@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vcb6/Vp9 c=1 sm=1 tr=0 ts=69414c40 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=BzSMFxQJ_lGk4zzpiGkA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 4A_IOf5E-XT5TsateBwpkJZKDtPHah5I
X-Proofpoint-ORIG-GUID: 4A_IOf5E-XT5TsateBwpkJZKDtPHah5I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwMyBTYWx0ZWRfXzrcyLik5beEe
 seZnN32QhTA+DZFnsCpkiLqOAAm2UFob3yxD5+97HF2elW2ZEe4MRI3p3i6Nymff5cxro3SzwWG
 wKc8/xeKES27AgMXpJZOZD/WroZOLx8ILy7z46sK3cXnwLubrbqM2FRoIsmvkQI0mQcaD2FLAW4
 qFbj3xVIP/lj+SOTBgOdDCMMNUIqL0IZ6IYsTR2f5GCIG0/n1HiLHEQRu4XhwC5wbnkGN3N/3PB
 +/wMELNBRHfn0e4DAcSN0qkxeQI41PR0Smtx4o1AGdCXSOEg+7IqRbF6n2WFUmexMAWBhy6Khnj
 vEl2BtrkOPBFfn6YuatK+0xwFMF6JdOmS1Aua3fytqRxtz9MjwLlanumNwDH9auN5n5ZBrILWVf
 oiQKYHnIMY1zVZuzOpfV0mjQSK4d2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160103

On 12/10/25 2:05 AM, Luca Weiss wrote:
> Enable vreg_l6p, which is the voltage source for the pull-up resistor of
> the CCI busses.
> 
> This ensures that I2C communication works as expected.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
