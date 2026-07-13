Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E465233ADA7
	for <phone-devel@vger.kernel.org>; Mon, 13 Jul 2026 10:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939543; cv=none; b=FjcW8NGDoWQ5vZd9Kn91SkOeb0nf/yyreaia1DUAICVn6tevj+Ijipu7i3aMGq5JQTd2/xgeoVSKbqoP6q4fkM82YKKOmh/pDUhaigCcyBmdCe0qYc99gXrtTDif9kklDS4dnxJk6CubR6WT+zqXBLf93tSeiL3yxpftnZ6Pdwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939543; c=relaxed/simple;
	bh=B6CAr3kqwiv7Vin0aJHCZqvOevu96eWIoRh+oQbeZks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TcvW/myCzIcn8WNi14BRq6Ya1lOtjEn7UMdepyc5tpDN57goUU8xuo4tbRqC23i6pIbAu+hkZieYWX1yWQDh3fkhAmBSZ11+bMfG3FKyUb1Z9C55+IQSFJM2Yhs5pucBbobTQif/HguGOPiKYBn6Xxo6P7vX9G/SPuKpAO9Bbb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HpV3OLRV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EKDq+Lmd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HpV3OLRV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EKDq+Lmd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DAbei9731614
	for <phone-devel@vger.kernel.org>; Mon, 13 Jul 2026 10:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LAo2B55+i0G+fZI2Hzc/8SyDCblIT6yT67FGpn4lZ+g=; b=HpV3OLRVikEMzm+L
	UK1KHoxsY71TapmYY18HEoY1RFvp5Z5t/knOcbgByrTEBTlTMbZwoAcv4ySlSbAp
	I2bmQKBLH9j47QKWtz3RQfmAUqeGZJI6VMvxN6LTOaraM6xe/Wk8qAHRBTrZDDr3
	yDJQr6byuNsHsdHnZCyQ93MiaxoTSMGvDYGfEv+9MF1MP64WtC2yld5Dw6qllOGV
	Z9TpBhOHbPpuVDzHhHVLs0EL6jfuo9Rune604NPGr4JuUtVgN/yc6JWQuKcu0sCj
	HLRskT6g5/bdGeET/o5TB3thmAmYUytN1f4p89p1+7OLUo2GoMhUxG5EZLpUGs4X
	AVIFAQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3a488-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 13 Jul 2026 10:45:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ebb599e528so7638506d6.1
        for <phone-devel@vger.kernel.org>; Mon, 13 Jul 2026 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783939540; x=1784544340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LAo2B55+i0G+fZI2Hzc/8SyDCblIT6yT67FGpn4lZ+g=;
        b=EKDq+LmdhCGKCe0XmMD6dmDpGWtHQ2mNVi6F9CQ8XJaVl7XwGy2GN1zUvkl1GBTjTf
         PexBbekBfo/g994VKPbeO8VCEF6QdwB/J9bGHsMX54JY0nc7yz+Bwtnb1VJINRg19PE7
         claN2vGUmDa4i4qA8dlSucT4a9niRJPv62icJwjwKIG5ViGfZ5MateGNF067h5gwdAde
         HgsC/3cl7KX7LV31jY4+bFkuSGC06vuySsu5Qx+J7ur8DpzJFcSnomTSJ05s/MYChNGp
         lY1KHIehi1iF/HjqQgsvdXorp5LxdfLZOdc5dfPtxG2PaVw2WGqYSLW94WTbg02jvNxT
         m4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939540; x=1784544340;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAo2B55+i0G+fZI2Hzc/8SyDCblIT6yT67FGpn4lZ+g=;
        b=Cqqtc3bhQSpcv5sXtCQNIWxggReG82nQkJYf9WWfA53CdZ/n+GrAvkJGv/kqxvXEur
         jl2bVoitf8w9humi3qf1qVTvRoIJqsBMXdSEr87X5pxP3fcJDfatYFYkEx709GSGt7Oi
         O672XvaMrKlubCNFRpNDrv1QZ4wnJhUFPylcnFIJUbBzgCM10p63XdJo8L6ktg6/3ngi
         XlFJaMTbHMok9f7VSe/Ai17Cm3vjo9QO01MXOMDQ3zMhGmi2uSR3MSIzHqknlBtVeG2Y
         pz/Vw5e3F1AWcTbXfM4q/DO0vbQ1AA3tb5H/rTZ27k8qityM8QhSuYDs2lj3YW54/sAo
         AIbQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+GORwt1+PXH6hQW2HeLQG5V7NCWMav9vnSmDBV41vZFEgYUVElX47PBTDentpJFm3Jcb3ye52pkzYJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUQaal/eYc+4QtPY4md4lBsceBAoPuAX6JHsMaywQJKd9R2IEh
	Nw8rt0PLIJKkEtEHLM7qB/pbokj/cd3nSPo5v8Y/8x1NiDm1JROhOgtwjrd6+Ozo06B8e8d3k4X
	J1Yg/vFql6KZSCkPuJr99VQGoBgcdWK8fGYYS9xZjZ8rTlFmxETNdTHEMZBEvcnmdQg==
X-Gm-Gg: AfdE7clArviNyzeeN8Q1ucbsPdXeV6L4DUTfxTFSRZu3MIhPnlAUO5Eg0LqfnD4dR12
	J8+hUGPmyJfEvux1DsRjn2/3tZZhptfEzpUDVBtFSO2Q4jZzgQL0JlELqw8e7gM4scjnPJPPYbU
	dN6E8mLziFY+qrPleDHVpEuYBeBfmxvLubQa6GLnKm1/e7uJ8WyrzTdsFMzaUXz8PuwKiOI8DNE
	YrEmI0XClszo3FsVIDvE6a3Xl7eQhwh5W70oBuPEhAd3/QO87MaeSGB8lqvA/PuwIGSswOZh85O
	nttE3AsGstLvXl2SqIkp5fDsGePNGJvK/tQkl/ucwtMk+tgsVUKcZEe49rHhHlSagXDSY4EOJbG
	il3n+fYKUM5tmvmsSxMysxJfCDNWblkdPM0c=
X-Received: by 2002:a05:6214:448e:b0:8ea:6c75:7381 with SMTP id 6a1803df08f44-9040018799fmr75217086d6.1.1783939540292;
        Mon, 13 Jul 2026 03:45:40 -0700 (PDT)
X-Received: by 2002:a05:6214:448e:b0:8ea:6c75:7381 with SMTP id 6a1803df08f44-9040018799fmr75216966d6.1.1783939539931;
        Mon, 13 Jul 2026 03:45:39 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd88aesm14502495a12.3.2026.07.13.03.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:45:38 -0700 (PDT)
Message-ID: <ee232d67-de45-4b99-9076-a04ed5842489@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:45:36 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260711-sm8450-qol-dts-v2-0-5eb2e86468c5@proton.me>
 <20260711-sm8450-qol-dts-v2-1-5eb2e86468c5@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260711-sm8450-qol-dts-v2-1-5eb2e86468c5@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExMSBTYWx0ZWRfX0WL37tv4zVBh
 Mq2B2hYU7QgqpYwiUyJGUwM1hp7JqQH1Zq1yGI29o8iN/j2CYtanPBC5NNJPQVVEIyZqtFTW9g1
 hM5BqzX8QGnhlyQlfvWN59PeFfbrAMwUlwioNMPCD0r4RxYnKGrhqQnfwIPUHMcCqUhxvSV4rKU
 s2W4F9p7AfHcsRXcIe598HqT1Su+BkYyJVebcatHHZcevgHyzVvSnFDxaxslYml1ZgoNRZ4CNHX
 yXj/q7bGS7dBlIHB2u/PR6vJycY+WN9JFNL6H5qtjk6m21iy6m7lFJDIuQF3vba5asJPzb+vr4e
 B5lK0SAWe6d7J651xgo4wNJwm7aaD8VJhewoOXNOY/e0vFX9s/w9nFxsrj8vXq2ciBj0Vk8hUc8
 HZCzm2/2Z1TmVhRWHc2u2u+PSfLBtclqOQdI+F+qFZJq03917Pl0GmPE6w3pw2eU6S7zdTPHLMn
 OAr3rSsTxHJOo4FCYMA==
X-Proofpoint-ORIG-GUID: j0kUdtUSiMa303ytWEemmvvCo4b0ezk-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExMSBTYWx0ZWRfX1O2l6GjTCLhp
 wZAmUCmA1J76VF/bsbyRDIC0Ys4W1CcJ/u3KfigQ9Brz+aNH+5T8dMARP5ZuEfiyN6P9+w5rYEr
 1lu3HTxxTyyJfzFpoxLSokZyO+t6b4w=
X-Proofpoint-GUID: j0kUdtUSiMa303ytWEemmvvCo4b0ezk-
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54c1d5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=WSKRrXozI-YAt06nlCsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130111

On 7/12/26 5:12 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> These nodes are not present on downstream device trees and only take memory
> away from the AP.
> No crashes occur without these nodes, so remove them.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
