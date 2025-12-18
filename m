Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A598C32E69A
	for <phone-devel@vger.kernel.org>; Thu, 18 Dec 2025 12:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766061004; cv=none; b=EcVqwMkHznHQdJ5cOyWfY05cM+5o2FdTeykvEAco40oDJBJ1KUJTdEFhH+DCDU44ZnYA3zKLSTXRNWuYpxXY/iolgR+aPIlyJ81z4MYi6u3GQdgQXedejl+btXCkWCgqiitcw+Njd8GEnpyua/WVb4qo2IUNPZdhqSD7913xN3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766061004; c=relaxed/simple;
	bh=Z3GYlgaczE1QLRU5rK6i6GanndeMW8eYR6R7LlT8Fg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZk952Zrtv13quh/lmCyJkJKETjLIkxcdYBPhy3vnkqMNFtyUfntHUrTG27vXkOBXwinWdjKVPYv7PU93avHKzvndiKq1QAu2Kq138A9t78E/vlKd5TsAuAs42pCByM9xrzBXJMnlBcKpnuKj/KOTZasqKALqoyywtCjGEvg3vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HlQkp9Mw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M4FdA4Zl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HlQkp9Mw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M4FdA4Zl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI92She4189705
	for <phone-devel@vger.kernel.org>; Thu, 18 Dec 2025 12:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1JBSuSadJBaxbqho0TQsSNgCNangw5M6GIUZheKLo+8=; b=HlQkp9Mwv6HrjkGw
	QOMVBG4/cfwtUddvSfQVmmSuZj+0ZTByBXTgnKA8VcSk3ZvU57Ca/8rSoKvdO60A
	7xd9tLIfqUqBkd8RdjElGfMoKZjtNQyWbzJoD/ktjW61AL7ySi2IO0CuYo4hmQQI
	y2gxVNJRdaxgEXYaZSr/y48OeZ48rzVuCn3KrjXjoZpIjtr1ISZnqGiTNPlkf7UP
	faK0muE6Fy82pUSY2WCknQoXPLLiofwjVidV8x5IVgwZsckwlRb0eVoGmges+dsy
	v8th21EKANfBai38DPX9zekjmWAjTfXrRMjL4a/QSNTyZzrz4mv6PZ4nmgTkbRGp
	RDlfXw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b47pkhxp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 18 Dec 2025 12:30:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1e17aa706so2949861cf.2
        for <phone-devel@vger.kernel.org>; Thu, 18 Dec 2025 04:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766061001; x=1766665801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1JBSuSadJBaxbqho0TQsSNgCNangw5M6GIUZheKLo+8=;
        b=M4FdA4ZlVj3VyHR0qu60H9/+hlUdUEQVrtiNRRmB/5F6T0EIdnxybtKmrd1DY1PtVt
         Z06EYuVwcvPUc+gA1BlUXumZdC/r254DHdltAZTfy1xTnxDVfuiTSXJvEkRRy8iBco+8
         FUiTYtJvhN7B3GAfViZiT6CSwGIpkhdhCDXG0k4rI9ZQyvFSMYUhbbzUDWHhECQ7bh03
         iHKd7t9KiCGgWwcQd4cqkHlGwT95R54agx/evWLqIXQIx+M5i+z/dajETqACpCvTy9qM
         Rq9rjRUJf7dalR9SC/OlM5jNC3F4O14xLZPZq1wqFthClgJw7W+0Wx8bpL6gtg12g1ZP
         zKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766061001; x=1766665801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JBSuSadJBaxbqho0TQsSNgCNangw5M6GIUZheKLo+8=;
        b=RBKa8BtEZwbyIDoutelAJKguLUFusvlXmeWH8bGGpAjcD/vFJKbX1bS6k9nlcnqMGh
         0u5EeSdHfZcNRBl9hVT2X54496oi9nB/+yfHCNZ20UA9P224F7M3ZJntHNK2yYURVMtw
         VBjqLXeHXcASlQv1IF1XjoX/ThmCGJHkQ+X5rKhYo7lclhT4dYa4Ga2AdkRXfMfZ6RgL
         82aM2b5Rm++ExOnc+eyIZV7eC8msep8plfZuK7lm9I0po4RQIH3iTN1I9D4eKSkZ00Q3
         ejwEg/EP0IC+Idrxh9fTsiNNHwghWCqnGzW7vZ0P19p/O1il3N3kJmJOrJnN7m/5TWLL
         jsDw==
X-Forwarded-Encrypted: i=1; AJvYcCU6jyeAZG56j9b61bv8Ql5S4WuqvRgaqgovJi4PqMKeoJl6X2AFRCVogjfLYpClBwEDvr3atXIHBcBwWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW+PGaifKLP9MIvgwHdK/wsFOc6aAaStLSiRszichiu5Men1ll
	LG0+jAMj6bOOPP6DxcLQVU0xLBKVDc8xfQLsUjsWp47TDrhfXn40vC8fq+q6RoMJqTy5csX6yXR
	T4eXBmP9Fl6SfMTY9lmEqqZ6449LVmgBlC7S+Qeefuc25UXvVF1KnnwEixyugU6XX4A==
X-Gm-Gg: AY/fxX7wImoKKXXBmbqX2s2YP+E96m5x/I48Rv0prOy/kobZV4AXxqvS6X18FXxc9rK
	NcNE+iKfegopGmZkyhuU+TiWolOYQD9RW3vdl0oGXBE90dYj4lVyGcr8NxYL+Sy5jsWmkMLyliq
	47fDQCzUuP+Qdxw4S6PugkmqUfLchKLgOCuLaN5FOH8f8Mshe7lMZvq7lPEyE3XDRhDPIsqOzFN
	HjT7w9Qj0m4G9SQ9344PlvtalbRpAg88vZMeNxvxr9pH3x7Nyd/8JoMI1L1iJHBEl2xWrOUYwPw
	4H+ohVnuWkRm6CRlWwlJjsvD+TsAOriTWYwWkfLqdQzwXLpKzxhbrAVltpFZXwvC5sVUoCzIrKo
	n51QXj84VoK1XsO/QvJUqHkt1RWqHbd015ZUPujK3DHPbox7rgZYPENIHJsZ+Ia/Buw==
X-Received: by 2002:ac8:5d07:0:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4f3610a9089mr19063031cf.3.1766061000532;
        Thu, 18 Dec 2025 04:30:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDcXtxXI+nmW4Iy4S8rIekI1G8iOdyV/+bKzZkbm3P2+fhPZyOem3P5hy+luahFwZYOHcZjg==
X-Received: by 2002:ac8:5d07:0:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4f3610a9089mr19062731cf.3.1766061000037;
        Thu, 18 Dec 2025 04:30:00 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8022f93e99sm218890366b.2.2025.12.18.04.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 04:29:59 -0800 (PST)
Message-ID: <c47ab448-7091-4c42-842e-12ae88bc8de4@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 13:29:57 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: msm8939-asus-z00t: add battery
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20251208-b4-battery-hall-v3-0-84e2157705a4@gmail.com>
 <20251208-b4-battery-hall-v3-1-84e2157705a4@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251208-b4-battery-hall-v3-1-84e2157705a4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mb3vdh-iqUM5oeiXLtqkpayJ2h2O0QGU
X-Authority-Analysis: v=2.4 cv=Md9hep/f c=1 sm=1 tr=0 ts=6943f3c9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=69Il93vAAAAA:20 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=XMUF6w0cWkiwYonXWGYA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEwMyBTYWx0ZWRfXyCDk8ZrB2B+F
 lQOi3gcnOBoU2pUXMk3+SE0CE/KdFiEVc/vzM8hvj3HyUENt7AQE8vgwCIBpzctfJYZH5Ucqedd
 DGc19Dx6ictm51j9b86/1iVmDr8Zr/OrktB/+bVY8dNQBj8/87h1LD9/k+ArJIGD/9nVRHxaZJr
 2xabiBWz7s1dveCmgjvSizQrKKLoWHPDyZ7y8eJu6kqBvEv66j3/kPHwsPbf0GyW+bgiDKy+7Lm
 P5+EJPivyYWgrxQNhkIl9CoQ8CifwLDz24X+YUgXe5GIne8m3n+DadErXq68rGANI5sDLCMZm0p
 UBtdsuOXHtm5w1wKAOQy08rWKd+LIpxV/ZEN39qfuWnAsuO+PlKkU5VFQ5TOzeAgHas85arf/kZ
 K0CbVsA4ndDr2lUcu64ChEfj8P77RA==
X-Proofpoint-GUID: mb3vdh-iqUM5oeiXLtqkpayJ2h2O0QGU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180103

On 12/8/25 3:59 PM, Erikas Bitovtas wrote:
> This device tracks remaining battery capacity percentage using voltage
> mode BMS. This commit enables the pm8916_bms node and adds a battery
> node to track its capacity. Battery properties were taken from the
> information printed on the battery itself and downstream device tree
> for a battery named "nvt+atl_3000mah" [1]
> 
> [1] https://github.com/Asus-MSM8916/android_kernel_asus_msm8916/blob/10.x/arch/arm/boot/dts/qcom/ASUS_ZE550KL_1936167_3000mAh_3p4COV_VBMS_Final.dtsi
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---

Amazing, thanks

I checked a couple values and don't see any immediate issues

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
