Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE04363C6C
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763478151; cv=none; b=ZXqQHTAuvBg/+iRBSlt8eQle+l54t5XUPJS9NYU/9slf9WBXB2lkEJyFkU8Tn1sFr4KN+crJUnmmICp+iGYj390PXU4xqmUnu7yS3PcYUTnGwzvQ+NG7KJLSJeWuHjw1W+pw1pdKXgoD85Seu4rNNy/uw9PYQB9Rvs6DDsGlhoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763478151; c=relaxed/simple;
	bh=AG9by4gkTASisD+Eqv8N+8wZae8+n63lFHeNStnqot8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XZg+0NIFYfEXK4xikfaQIgiLtxtje1Jpi6T9KcRkIxnhSL3t+SZtyiBy7mfTYkW6Rs2YPTz06xvVVRdHzHshbfqs30W3X6NncaLCdaW6puOuaJ9Fg8Rnt8vYiQdGbIzMAPXjy11TFJQORuBOOeXY9WYjrsPZ2bg6s34Mj8Zx2TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vr8Hnx/V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BToTCAcK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vr8Hnx/V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BToTCAcK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIDkhj3623768
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 15:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W3Ku94Mnbq4R2C8SGG/JayArYSw5QUBYUNcaxSizlZQ=; b=Vr8Hnx/VLUu6Ye+t
	SDLKbfRlMdaaZT8MctPeW/Bi3mmavKYdeRkIQcdAecxqDsCvLJ2wFPkoxte+HOl0
	s1eyBgJhXKg672Fi/zAhxjXpJCijgw5HE4u+qqNosb4Sj0tBZqSfE6XFv5LrUi3P
	EvNMkk97ca0VmnoH9ENj3pU8mXkHa1JHMsw3kZ+/gmed7cN1uJ5lezM61tys2a2J
	73Lm07KrO+wbf1N7xDImuUpKBNjBXggbVyvVMwZSQcG1pgfRz4jChy0oH1PYWPVz
	8aDx08/F+5Rftp4IJnmUNULPJDJcoDlR6tyvXs09/ZcYz7Cs9Z57hmoQT7RIHZ6A
	lwMPnQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agahfatxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 15:02:28 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5dfadf913a8so652416137.3
        for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 07:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763478147; x=1764082947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W3Ku94Mnbq4R2C8SGG/JayArYSw5QUBYUNcaxSizlZQ=;
        b=BToTCAcKRpoiM1wRKWzXmv9nv/YgwnEoWrI83rrRsbnpKx7saAyav9T52OAbglFaxF
         GlngsGFsV2uYObvre8gw0W2O9FZQ/yio9jg8fYgK/BuzxQPRvMczPmLbVho4p1d47EWk
         CDTI1LAAqSthXfddWZdOeFSswPKbkzn95ZEpofvvc8PSj/KCytmQft1zw/CNtNlvAhNl
         R0uLwVZAwS9WmOePQG64IXzPrH3Vx1ucRx9GudKb35WNQVv9BshK5KUsCATG5GMNyTBI
         dnsHXZ6MPhLcJQ7MnuUN6PKLN06vlEEAzx1Qvh/D9W7khuEX7vQK6PEINYzWPVV6f4+I
         vvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478147; x=1764082947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W3Ku94Mnbq4R2C8SGG/JayArYSw5QUBYUNcaxSizlZQ=;
        b=bkChpyYkph6Lzib2KoxaWGJFnwC7vHgh3prYF3DOIXLslhDMLplecTAkWGM8LxzPVC
         tQrHZchX02/fwMJkiYY5jixmsEfRZS+bw7hVNVYWs7HypOJlMdbmhl8C3LfI8e0CcVny
         +/OUhN4RsrbIXmpnjG9ulMvBVSBmZCa4o5SqlG9AxUfa3+4nf8emmMN7KLSG10OWhL5Y
         KW3/Be5JX8GiE4HyvxBzczatfMNmBoIAcxrkyfeinQGiXWvCcpOTcevbUWsjjwoVqq5j
         7dJOpDg2inCi5OvXzi8JOGr5RW58DVk75urs6ewFcptowU5e578tmJve4/R0RpShLt7c
         P9mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi+fa8iHCUS5/ITqt4BoITyyECwV0aE4WoktmONZvRruUBs86mprnyfB6YkETkMNPnTnZqhoH3oRcx+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvWHNFKN4YUTfAH7gfx7i86CjrbS41ekiiT0+sf1qyltHXEoBZ
	3ac2CwIQi43sixyc/PxKXfzcx5teoYCSZApjzWG5tTKm7BQ71U6ybTib8ClCrBz7LwZP8+ca0Jd
	JYD4DwuQk9JH2ru53EZ70+7k8iH0Xrb5mSn74GmDnMpgz8lUFfedoq7ZvduMZjRrN4A==
X-Gm-Gg: ASbGncvb6eLRy5d/bmFBLPoJMGySJSKA2KDlO3Ti2HioBKHHlaij5TZkn6kVARDCbLA
	4/3DW2ZWqLdB3Ua2JQy6B0sfAGeF5EdT/0d9nsA62e+sCISFbkaSZaM/hyJaeGsX9WODJJZB+L8
	BPr8qa9dJdUZ+3HKEnC7vnkO2imsIOHOyF5H/o3PIVtCZ0DM6YGjF626/gO/6Tu8SyBQeTvSObT
	lkosPL32JbojVeViYUgud4rAWTVg8Jyt0kHqzbwSCq8d2TvNCHvP6AM6cfo5EUqLn/P75Ia71uY
	7+k1+y/OmSIhExVAeqWJV+wC/M9ItOQCf/89V4ppQ7SvZlQ4Ww8qOFMGdHal9VDpIoymhSE9xi8
	h/UwGOFxLbmuyx3nxlsFTG9tv/eNnd2RffN/pDSa+mRp3MaXr0vxXaY356fuAWgZ/78g=
X-Received: by 2002:a05:6102:4a89:b0:5db:ce49:5c64 with SMTP id ada2fe7eead31-5e193d07939mr483675137.5.1763478146692;
        Tue, 18 Nov 2025 07:02:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQFPg0Mz7N4EDPv6I3lrbQjG2U2K8407ks4hpoDAguiOS8G8eXyBUOQZPBwadNoxrO/0t0tg==
X-Received: by 2002:a05:6102:4a89:b0:5db:ce49:5c64 with SMTP id ada2fe7eead31-5e193d07939mr483573137.5.1763478145615;
        Tue, 18 Nov 2025 07:02:25 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81296sm1392855466b.6.2025.11.18.07.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 07:02:24 -0800 (PST)
Message-ID: <2767d14d-dadb-4854-b1cc-f04bf239a39b@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:02:22 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sdm845-oneplus: Don't keep panel
 regulator always on
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251118-dts-oneplus-regulators-v2-0-3e67cea1e4e7@ixit.cz>
 <20251118-dts-oneplus-regulators-v2-2-3e67cea1e4e7@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-dts-oneplus-regulators-v2-2-3e67cea1e4e7@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEyMSBTYWx0ZWRfX0AhxCV1+7e1N
 z/Zh8rvB+IPrlaTdoQ/2/Z/snUnmcUg1QRjT2Ew61ev5jUUhEB+b8RJJEPik/7K857Fq8Ga2p6k
 8CtIk2MswTzOJiIr4jZEMUkoY1lbfBFiSk8y+jiJU5rkCx72raUU7xDA5PA7TWuZRRHpMqlHM96
 RcUmVIEKPCLon4cLJmxHcr11EOGYcWzmX127MOxsAFN2C/euL9NI/kPrP2B+sBTI5ukVZtzBgVQ
 eNHNbEEfG0UDsumYvdq79/7YY88I1IY48proc0oPfYSe+2a66KyjgFS/k4vhawWVsMaezYb4uHa
 mCpWB85XoeKuktRmjjAkcJnZSx+TkLWRPW8IORVf+5Mp68nAMjwdRohh7n6K26FBtqLXcs0WOpz
 Mn2MJPBSW3oGhFzJ+dV6l3rgEZ7dsw==
X-Authority-Analysis: v=2.4 cv=RpTI7SmK c=1 sm=1 tr=0 ts=691c8a84 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=DXHULxexB2UWdnxT3G8A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lrYFfpvKmHQbevFfAVr27WGayVG9dr71
X-Proofpoint-GUID: lrYFfpvKmHQbevFfAVr27WGayVG9dr71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180121

On 11/18/25 3:52 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> The panel regulator doesn't need to be always on, so remove this
> property.
> 
> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
