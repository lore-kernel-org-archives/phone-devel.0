Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AB644D021
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 14:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768919992; cv=none; b=LZWWUZakAKx1a1Oz+PQ5pDu94OuZRUKSkif7L8DQz/8LuglUYlZe1bdbR6kB0jSO4EdJp+YLPzl//0eLoZu4tUlsdwtgEkFwc0IjJbgagK2+RC34ndeTTONSLSLZaFf8DFl4Y8++DQ9/lMkvVZteM5UgapzrRqN77lSSJu6fHi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768919992; c=relaxed/simple;
	bh=aHpg6nyTgxgCsK8qde5p2NcP/Qo4o1W6B7uQhcxzfKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C+irmDAzKm191SFT5d5cKxf2OryeN2Ba3zTdr9VOeONpeeiRkut6REVNuTBDddbvZ1q34uVX0qN9q0IbF3wlU8N/jc+y3mn6IYA0rWg42LrwulBvc3MJ6sbcUKSqoXRWOSG5heCOo1GHAR8TNjqIWb79ezDo/WB/rFVk4F3SIxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dB3Pqwic; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ds+KugBU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dB3Pqwic";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ds+KugBU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KB6sAH3252530
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 14:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/+Ca6EiM2/QcRj/LhjCE8l/Go1/X4qNhdJDPChMt9p0=; b=dB3PqwicSInFkz0q
	ebBidClCZxU+TeyKKzzVQc+uxWBr8b1PV3j3y1ubiWK8xrMG4R4yKpslWiwXNN4/
	5SzE1NpicojbuQh2WargZOKWSCDDrWEtPNfoLpjnT3vMsQC1vWx9Hb/9n9TvFglZ
	jilvPQViBmW45Yvo0Ro5eRtD26w8EuWSujQr7zc4F8mOno1ZDRl1xsOcnULjAU8C
	7MYyiPvrEKUc4FSSRw9SGqwlea0QVIFCQ5rr479xxLT0BUd90G0HR31bGUKITQq+
	eId9+iq566UODM0F+es5sKZZt3tDyEvzpFLvJSPiid6R7pCtepwIUbDIVHFl+EHh
	CXNk2Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt27ahtnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 14:39:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c536c9d2f7so200929285a.1
        for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 06:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768919988; x=1769524788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/+Ca6EiM2/QcRj/LhjCE8l/Go1/X4qNhdJDPChMt9p0=;
        b=ds+KugBUcOKV7bZpt62JglcNye2tYo/Rq8XAmgJAN3IZXDDPXkA83JQPUAXWuDPTHZ
         bOTHsUGehCogJKeogUncWKyg5Pjk7IxGxld2QKXyQDtJtKoFGCBAykxa77tHINDCb9TG
         PMVt2I7PkEvhT3H8CvAm07ofFR/3ZL0KE6qyG/5o2eJxOjwJ1lPfn/CRmtbKSJgrmqUc
         POuhv7d0gy/3i2cKovflywCqNv2nt+70WhBVniCkOrxN0XtULI3TKHGXJzvEwj8kkXGw
         AAY8aDiXJA9bLcSaGTKkMikFncDphrNEZFD94Sq/kmKGKfWlWjXHJy01GarFK9/tC0gw
         PzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768919988; x=1769524788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+Ca6EiM2/QcRj/LhjCE8l/Go1/X4qNhdJDPChMt9p0=;
        b=ZwvfUtll1dt4dltYCRWX3mI6x0ghWyAVI7hPZObl7KvXcvHWte5JEDZIWMPnEM+1mO
         1ycAysG8ADHRlsld6qA2+WOGGpEwhi2U3O8q5ALc7Ws65lowPOdSmwuvejvLxvQwc5VR
         lxshf07Kqp8pvOwzpjF/EvThFMmQwhqPand1iOphJ1XPby3koIv6RSI+VatCHvhMjpYe
         l5mUP5wi4x0+R3Eo0BQQrV59W0oF52dcGf0ToW8E+SS6ZzEi+4lBWGQFt0PubElrFBes
         9B9ORC+6DtMj+2jco/mrPhpyddGKKH88vrEDbB8oCn7KlECU/Yghj+DkdKshDOYRe2i9
         cwUw==
X-Forwarded-Encrypted: i=1; AJvYcCUmxcag4Dkd3m/R3exRISS3ZrQa1kOlH5feqDl73DKmJoCJ3G0WOBd0IdnZVKbvtkv8VGmivUmYq78JZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI9UaT8Q4pirPB7vVLXxpsgTEvE/nGweqh+xO/aSRZJTSrVo1d
	v2dkNs9bAgBugFqB5FkEUOiI6vdoZcOydO1ZGqxcpsE1z33TUJTJM+i60C9Sq7J3odID99mHCyB
	CUAcVdzs4bry/VDCNaKllEYVUY+tcicbw/c+UEa3BD4cc3HlayxgBab7qX4nV02emNA==
X-Gm-Gg: AY/fxX6EeZ6RMgSNOBWan2TO/MlAWRVWZYI8cB+dUSfmEVU09EyYA+j69SivDN08/f2
	idwEoQJuLbofmI221Zs6UYcNXOczyCUloowPMKf943BaSRMv+S042sLS9LUnjUdEsNi1sXjZ8Y+
	OFbw4hNiYgnMwhc4O11oKp2W9Gisj7IbT9gVs+2sQAbc7O7/y+niPyhrVY4aGC0Va++v8mTYp6E
	nb0iVXz7uIB7CmdGdGUfLkYDGW9zIk3QGullVtY1NZoq2+3nPysCUkCScHVVXrZBM0gqJzVYCZA
	SNddFYTtFcoV3c8Msj8i3BVitzpxYVdJY//YU2F+NcOcxKM3iI3aAXPep8prLyIdr7oNp63IYP7
	wHKwGXsz562y/0tvJpPm1nB2qY6l/lo2dfwTbJH4df95SWIfwdGcXgtZsQh3QT5ufyHQ=
X-Received: by 2002:a05:620a:4687:b0:8b2:df32:b900 with SMTP id af79cd13be357-8c6a671b492mr1521243085a.4.1768919988198;
        Tue, 20 Jan 2026 06:39:48 -0800 (PST)
X-Received: by 2002:a05:620a:4687:b0:8b2:df32:b900 with SMTP id af79cd13be357-8c6a671b492mr1521240185a.4.1768919987684;
        Tue, 20 Jan 2026 06:39:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fb973sm1387385166b.53.2026.01.20.06.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 06:39:46 -0800 (PST)
Message-ID: <5fe80f4a-ef5c-4008-88e2-60ad1f8c2a18@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 15:39:44 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: milos: Add WCN6750 WiFi node
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-3-27b4fbb77e9c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-3-27b4fbb77e9c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iNNjaBNoeYWfYPG94yZy_H4Na7nGYeMB
X-Proofpoint-GUID: iNNjaBNoeYWfYPG94yZy_H4Na7nGYeMB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEyMSBTYWx0ZWRfXwhMY0ys8G0O/
 7AZYHAVOEug3FAO2Qn+NQR/oza7FStlOdNG/fuIorCAXbra7c8NJU3Rc48HHhBn0rWYkZns2S3L
 Ej12dMorlEY+hM2S2lY1Nq3avMfi5e0tpXua5g7ywbFSW2KczJrkoLhCtwipQ5nkdPy/iyMFu8+
 AKc+OKsXV2sP1nAFVJM/GMIWwBvI9CFXzo0G3wFqb/8enjbsBTeKpGmef74JFoPtlC8GczGUBZh
 3DH3mZ3FtypK7FNs3PRNqfBNTsfF51N8NkIe0ITaCkS3AXSmP3INWGplYp1FsRVXp8mWFeJhIo4
 zXtIfd7bh8L/plIFShNmUPYK6tAXQr5oEj40IzVaY34BaOtY2Tgsf6Sj5odQFt8N1DNMk9Ua7Be
 qS060SEAo+U+SAEMv1PbII/bo4Hh2UsuN4O38eIOwEn9/yZdWvOVkha+5i6pp7Piy+DhnXVDD1j
 AQ3IDyMSSVVdK+vGBAw==
X-Authority-Analysis: v=2.4 cv=P6U3RyAu c=1 sm=1 tr=0 ts=696f93b5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=COk6AnOGAAAA:8
 a=XxyedzFJey02p2Jel3IA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Soq9LBFxuPC4vsCAQt-j:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200121

On 1/16/26 3:50 PM, Luca Weiss wrote:
> Add a node for the WCN6750 WiFi found with the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 46 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index 024e1c9992fe..80feb3e9d3e2 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -2043,6 +2043,52 @@ gic_its: msi-controller@17140000 {
>  			};
>  		};
>  
> +		wifi: wifi@17110040 {
> +			compatible = "qcom,wcn6750-wifi";
> +			reg = <0x0 0x17110040 0x0 0x0>;

This reg doesn't.. sound.. very.. good..

The size being 0 is of course wrong, but perhaps more interestingly
the base address is a register within the GIC..

> +			iommus = <&apps_smmu 0x1400 0x1>;

And this is a PCIe stream

But I see kodiak has the exact same setup..

After digging a little into the driver, that 'reg' is apparently
indeed consumed, as a base for PCI MSIs.. I feel like there should be
some better way to express this.. non-everyday setup

There's this commit message:

commit 00fd24089b8154ddf5b3e724e2c4c9974b9ba91e
Author: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Date:   Fri Apr 29 22:34:54 2022 +0530

    dt: bindings: net: add bindings of WCN6750 for ath11k
    
    WCN6750 is the WLAN chip on Qualcomm Snapdragon SoC SC7280;
    Though being a PCIe based solution, it is not attached to
    the APSS processor (Application Processor SubSystem), it is
    instead attached to another tiny processor called WPSS Q6
    processor (Wireless Processor SubSystem) on the SC7280 MSM,
    where the WLAN firmware runs, and it is the WLAN firmware
    running on the Q6 processor which enumerates WCN6750, as a
    result APPS processor would never know such a device being
    present in the system and would not detect the WCN6750
    hardware unless and otherwise WCN6750 is registered as a
    platform device. This is the reason behind adding WCN6750
    WLAN node in the device tree.
    
    Add WCN6750 wireless driver support, its based on ath11k driver.

Sorry to hijack this patch, but I am not comfortable with this binding
as-is..

Adding +Jeff in case he has any thoughts

Konrad
