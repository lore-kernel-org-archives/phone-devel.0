Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6863559CE
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763478143; cv=none; b=W7J8vJHjw9wc9E5E/cQj/HYcNpsF5zh0Zdd6V/DJs1ekzQF2QvfiZtgHSihfQRUnuRquFAbZUcvg5fZJ0eOAKFyHHrSqvQy1Q/RfRKK5BdvaQgrVNO82QBsr3EBACFpjr0zoE15u60Yg7YHP0/xEtQVxNX+sNllFHIANGO7Y2n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763478143; c=relaxed/simple;
	bh=F2EcUzzrDBVg2CoYfVhrewmpZHJ4gD8b2jnpX9KGKDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQcciCVAC5EC0ck2K816ycpHUr41v7vKcvd8m+6XoBBDzGgRprwLtYhYwVtKD/hwkWyppjDxM/fVmeekeD16FLdHZuh/S7sk0WNKMvinzPJP1sPhz6HWlrlbP3Z3IJ+nHubh5Yqz0bW+cJq7IDUnxTQnPhZnd4HxF+tLZFd7MTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKE829W1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8R+OVJf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKE829W1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8R+OVJf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AICApaL2802314
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 15:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O39BO97h+YAW1CZjvfTaDx7JV63porAO60M0mUkmq8w=; b=KKE829W1Y6JeQ1hE
	6xAvwFZ1iTDMnDmxzrDOIR6oDAbDyqPaKGkfzXiYlkNR7lCWC4h+MuS2Ibk8zt4q
	zTws5iyM8zOkcRzVeTvPlgmjUrcZYchoX95OG7OjpITyVQ51Mea8JZABSgg6GMdG
	ZL5g4Pkls/S+6uj51TYqtfHttuxjfKv6mAC6hrj7gCpqO3iIqt7CxpO4ANGKDj9h
	b+K0Wff6uGUTvbb4nVq5TPZvNMKNDa1WpNMtyDY3e2lAy+uyIMXsKefgz0i0m2PZ
	rTNNNwfB4Ykjl9RVyggEc8kronyjF6r6lEat94ozyysMEZTL2MlY9kiAH9vCJ7RX
	tKQ3pg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agrk20eh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 15:02:21 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5dfb8e7d182so915671137.1
        for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 07:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763478140; x=1764082940; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O39BO97h+YAW1CZjvfTaDx7JV63porAO60M0mUkmq8w=;
        b=J8R+OVJfs9EMG8EOFBECQ1bfq380pFEb6l9dp/neV9s0eI9mwln1s4FrrAgVACff6b
         ywo22Td4RWjlWpEyJM4k+jQ0qapTVvvs5RJJ3p5XVAlVnzwejDLwxYUGjw30NObPA1P+
         NAQdzOtAyVCwdSyOvxqm7gBixPeI6oUxoRpbkSGKmWjsOUbLvcUvgpsFf34NzL53/nQP
         ad7BgUb5/2QeIeVdLJ/o/zI3Cie3saO6iqEFy/IRP8uaPK0TTPiClfMCq36B/kmw81FB
         20Sq6sPKxlPbvcxN1+p8ThuBJ63GFFVksT6/NAc8N5zghikG+a7AktfaH73rBKvSOFdo
         KiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478140; x=1764082940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O39BO97h+YAW1CZjvfTaDx7JV63porAO60M0mUkmq8w=;
        b=Kod06GP/EuVp9PUmvRzu5N/DjonO2elsOypoanr9NTMYslwybLx5yHzHrNMFUFuuEU
         zjSGawt+BRKRVg7LwKQ9hkeK2YYb/Y9j5OrHzyStnzTWlhFF4TPOQjKrlRlCuavwxZWY
         NHifBWpeLYwKB7CPlo5XqrBJTpfCiinTqgpuWm8sHVM6fOuzsKBklUhF/NPWMHp2OPRP
         In1q46LHeWzO8zFPI+L29mORZYpSJNSplnMEsZxhlSrOdcH0n+oSYv1A+EKy7heou+TN
         AcybNkUZy8eDhtcBF2nxDKcT6FH1yQR5nn0VhuCTQwHugzCbIS1LUvnxP8LutMAFsN5x
         6HiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4YuJGgZPydSnG9wJ1D7oJmxiyd6HvZHhTwNcRsJAxuug0aCQ3QtXuCjf1Wz6oQSdY9mTvQL8yfURqnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfhn5iaEYFA4kzx3sVcpnwUA8h0a5Zmmy3oIXTFcTifjXcebnG
	3eQxMUes8Aar+7xagM6oG2uTBa/LOidrznz8nLwwVDf4oQwD2wJZY+Mkw6t146WwBiYu75aobKI
	+MlVqiIdBKTujKDL+CkSKXoll6by80CfbRcrHvwrK3PN9j2hzIcrKdF6WgsZPELVfAA==
X-Gm-Gg: ASbGnctBNvmxVzn89RTEevQyeoaLwB1EZt0SC1MNKPPauUv9hTieqK0a/ygehACbAoq
	NubmwW7Y+lNYP+cjgSSO12m637rrKFi8wRrZjLcFEADCJmZ+ZLfuMsUNMYLVDbkp+6yIT8wmBAF
	XmzmxagORf8GAsPWE6YmEIGA/Zp34CINSLZFlkjFvqu5fRjcW9lZk7Cg7pOVlHHem1X6dQpZSRg
	VuusBayK6EWbLI54WywtGzVBtBLewsTx2alCyAoQNF8VRADjEdNsvtnlOXPWzKcSh2+bbWI8U7Q
	sD4CCbyhmgxIH/gCmLQykcRoLaHc8y+zb9xrKhB0e61buHoGvmCVpc6ga5QvB8lLoq3gse8FosI
	5Tgz67B7YhQi8gYhnFBwYErwWl+78Y7a9VR7JBha8F2bX8Oo9v4P0EX9dicP0h3kb9B8=
X-Received: by 2002:a05:6102:5e93:b0:5df:c33d:6e58 with SMTP id ada2fe7eead31-5e19376ffefmr480464137.0.1763478139075;
        Tue, 18 Nov 2025 07:02:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFahTTAn3km/Fv5c/lUYnZ8T99gA+8u4/AuP+6hbWLY3U4FqYlr7wW98wKjJPM+2+UvB5MCkw==
X-Received: by 2002:a05:6102:5e93:b0:5df:c33d:6e58 with SMTP id ada2fe7eead31-5e19376ffefmr480419137.0.1763478138628;
        Tue, 18 Nov 2025 07:02:18 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81296sm1392855466b.6.2025.11.18.07.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 07:02:17 -0800 (PST)
Message-ID: <9611094b-dd2e-4f4b-b1a1-4ba8817d0524@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:02:15 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm845-oneplus: Don't mark ts
 supply boot-on
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251118-dts-oneplus-regulators-v2-0-3e67cea1e4e7@ixit.cz>
 <20251118-dts-oneplus-regulators-v2-1-3e67cea1e4e7@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-dts-oneplus-regulators-v2-1-3e67cea1e4e7@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a6Q9NESF c=1 sm=1 tr=0 ts=691c8a7d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=BiXyI_okxTJ3JasmUDMA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 5_QPkqCkrAUtIqitOHxgADNjoic_aZxb
X-Proofpoint-ORIG-GUID: 5_QPkqCkrAUtIqitOHxgADNjoic_aZxb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEyMSBTYWx0ZWRfXz3NYCjY2tz55
 9PNb8SmbFypFxT6TzNkjQ9TKAVN9EKkM/D3BsZXeatjEemDEinuKHInzmXrvqOlQ/3tn2FP4sDf
 u8s1jn6UK4MAmodFFq+z9K2LRJ0XSE4gU6WR7IIOp+kF+PdXQ0omjjXmyGbOCwAcmBrkRm3j33n
 eilyTb9tbevQGQnnork/tJFEXTgO3/6cRyblJiIhw86azLGq+Nm0H+6J9qFM+59ELSi5ExkaccQ
 KclTAk3Dm8xS/59yRDOfOlzyT3c7x3Ja41S2UqfNRwxNXob9qKcgMjLgGXWu/LSoAjpCzCuDK+f
 BvoPYWJOjt7sQ2+oyK8yJhWNPLOixQ8aYyXJjUzG342LZXVk/wiOBlBS6r7inV0ULpW7+bOvxgS
 2gQ+XgA9D7vq57AXEffzFWueWKsEbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180121

On 11/18/25 3:52 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> The touchscreen isn't enabled by bootloader and doesn't need to be
> enabled at boot, only when the driver probes, thus remove the
> regulator-boot-on property.
> 
> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
