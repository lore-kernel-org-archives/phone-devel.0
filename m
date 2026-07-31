Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9006B38D3E6
	for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 16:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785516956; cv=none; b=X6djNL8LFBPs8M7+jVxSXxxWv/9by8WZFSj+S7Lfo+lhWOyE+4I3RPV5WWANd1b9YfpPsqNS4Apt3k0vQvqHj2bzreWPUloWOVMYXUjKFGXbB/zSE3rlICfhmV8dCu5c5UwAU3aMRZqT50ZEqEa67M9vnbaZKXAzZrgyxactGoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785516956; c=relaxed/simple;
	bh=vNQcuHZwnfBcaqBRKp24fl+ic099dWBRsaw7Ei0waQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uINtsa8xT+P+9e3HByexfD/lLiQkuXbNJombkPaMYnXrw53pyu0m0qD2Uy+PFME6/fc8Z1lx3iPbrcL+hG7NF8xXdSr9LPVRhTjz/UQwlbBkQaU1YX227EEiqKBORxtD+Wimuf2DLYEQWMJPuvqzoo8G1vg37wWwkL0aF3bAqGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YFdMV4tT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrAYa2nR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YFdMV4tT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrAYa2nR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOjMD404135
	for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 16:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8/wy2Wv/9rNwpuSJ2n6D4naMTb2qPF9MQec2tA1cdJA=; b=YFdMV4tTcXF5RLtW
	wD79XefII6C0bWPZAykN4hpNtvSajCMxrMvzT9OpnB4ruQq/crUuTE4dxpwLNen6
	FdIjlkNK1Ma8yjAiQ4D/o0PW8JX8b86+Pio1EWa9sD8GNEGjjOjBtuSNxDJlpxU7
	KEotBtT3ESzEYvPlwRm5c3Ity0MaqOrQFLS6zh0ZOu2wErn0snB+Dik2lGAT4ZWc
	HzTNojJbi/kquXZ6tiWcLs8J2FaxYFDrL/7MgGoV61rmpFJYMLHavdpLrGmtXcZU
	vg8I+X3K4JWBXaPOPhegdCq6F1Xl+uEtEAHoPeZGkniLuPBRYn/QC67vZapQmnx1
	TmaZJw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frufkh8h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 16:55:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c9e97b626so1854981cf.1
        for <phone-devel@vger.kernel.org>; Fri, 31 Jul 2026 09:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785516954; x=1786121754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/wy2Wv/9rNwpuSJ2n6D4naMTb2qPF9MQec2tA1cdJA=;
        b=XrAYa2nRZRBX4Iuzc6ZqvJyq/Hne1V0FKcfncJzFIfcu2syAl7Sixxda/1VMF31WE/
         h+B5GvzkPRjXhn6Xpl9Qhb50oHe49UnQJ8+s4DS7aixdusm2m92rEtAKFXoHWQCHir7z
         /qDs3X08/eSa3YjFohtKFuVd8exgvGtprsTPrwWbVBGp0rkfUS+bdvi1H4s8HJhY/aI7
         WxvbZ1JNjbNzzKz3uMNKe2eeUrepPJzHctdHR5RW+04r6H7E9UgQn1DCPTo5dj2uZAFA
         8r5gprq2ObexvOcJs7S8KhcCnX09XL1lJVov+S0oc4Bd4eg51cQ273qBvxUIx/hJg6p9
         hR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785516954; x=1786121754;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/wy2Wv/9rNwpuSJ2n6D4naMTb2qPF9MQec2tA1cdJA=;
        b=tLaCM4JGni6ttmOf1TaGwdwrZ2kTZhwGt47lRQhZOVaM745dzj/zE9ToVlBG+Z2w1L
         MXmEf0JX8KqdaBFUiD70hrv9vKRFhkK/Ny5nS/qe2KRl6WnG06N4MBZWh1jTgg3QLP0U
         1qLTRMhObppBchJS+zN9NnMBbjFBqaGgrEhl+KoAYKTqrGN5DlzCJxcqupIqNEfj8Abk
         JkVhsotb/5nxA2T2aDsxx6//IROV4n0lJT3u+2PRZis7ebcBX+qNjvF8kSu3vMWXI/lP
         sRRX79BRzwbPH7QeVQilmxowo3+g/elyleb4s+GtuOpaPrh5QMOOeL3W5fjVGOkoNlzK
         cttA==
X-Forwarded-Encrypted: i=1; AHgh+Rptn9Yzcc5vTGaBP1HgxN1jCd8s+nMFiyDXQRLUD1eUAvryk10nnrUcfaZUe3vPuPTxV5ApYdLI0XGNlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMhxIEExyJi1E8eyW2iosEAdT9/TRDuMy3gG/HxoQ5bk7cKEtS
	yC3IYOzo05I+ZHbSmtVzQyAZELIEyaHGBKkSNLUpNMOwF3i/HLWx/S8a8Sv+U2Rp4EmTiNbuyJw
	Jv1Lq/G5wZ+KB64hL9ziTELXO43IZiH9SSwz8UHQR3+zcw/CP7E1vS1WHP34YmoH+Zw==
X-Gm-Gg: AR+sD10sAitv2LoLvCA7gTXYxOlUqNfIsaTkUm/DViQntMIDTowHRsGfKhoNgLBVN2x
	rJ8Y8ye6kxyvwJAiow/cCTFoUSZVlK3rnN1op3oi4s5WXqpXaUVkc9quDyxZxoRRlImmI7CB8Mu
	viGNuas2BAQRv/3TGgfsmxnMBMTgT28Za2jKs9/NRSzI4HslGcnilXF/7iaqQmlprPlKYzn3W04
	DPD+rOSFnWw4+Y8usEjWJPdAxYmRj1cW7yWmWwAMcGb5e81POeUTXE6gOGneF0EYG5yTJ3SRB+P
	aAxU4e6jbiwWHTPUjVWScwOG2bU1LPikdDeBEmtbKhLZPWxSHNe2qd32jmFGG6wtZb4O2pZF97N
	a5JxsCmTR+QgDYF5YjoOYCOKu
X-Received: by 2002:a05:622a:791a:20b0:51c:2101:f0 with SMTP id d75a77b69052e-52b566f6530mr10087101cf.2.1785516953775;
        Fri, 31 Jul 2026 09:55:53 -0700 (PDT)
X-Received: by 2002:a05:622a:791a:20b0:51c:2101:f0 with SMTP id d75a77b69052e-52b566f6530mr10086751cf.2.1785516953414;
        Fri, 31 Jul 2026 09:55:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c655626sm2944226a12.22.2026.07.31.09.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 09:55:52 -0700 (PDT)
Message-ID: <4f02329f-1c0e-4684-96bf-e71eb5b73cc4@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 18:55:50 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Add
 actuator for main rear camera
To: David Heidelberg <david@ixit.cz>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Martinz <amartinz@shiftphones.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260730-dw9714v-v2-0-d5da19e6c60b@ixit.cz>
 <20260730-dw9714v-v2-2-d5da19e6c60b@ixit.cz>
 <3ac4eb1b-348b-444a-bba0-e4c64d5b57bb@oss.qualcomm.com>
 <b9afe038-dfa3-4927-adf3-5b99885fb911@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b9afe038-dfa3-4927-adf3-5b99885fb911@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyOSBTYWx0ZWRfX+AnTHcWUYrUw
 QPrpZRSvRw3giHWejUwtI/7uEcVoLUn15aPtay/M1IS6D3SkGaKNXEe8QJxmV4A04qMjtHI74eu
 Rxh1HbwCzMgTgmvqC+FY65SzFhSRN9g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyOSBTYWx0ZWRfXxOHPL1zHQwqA
 GGstW7ZgGq1R4GnTNutRn9WrPrFCLqm39KM5YU1qcivVJRSQAZYuK4aegaBfuFkXL0VM7WJv7Zh
 maRLOx3unkujpqnwnsJXON0raPTrHOI3w9VGaBGAVOgVHGKY4WejVsh1F8FniCwSD6rzMIJfX4M
 63X1eevJs/iOYfFSBzKFpS6XiJkxTLem9szZPrbZcGXjDncpt7Mx4C468yVr+hAmZSSn4txN8OV
 bANPAp98YrK1Elo1mXcn5MDQl5uO2F2LZZeKN/hb9pIuz2opewfHRaFtte97zWynZForpL9mH+z
 967NqeNQpMBMMiup5gsuqkl3x2/SQI/vEaN81EQ1A155nReJRbavRCaRAmOD4fEx+5k1sL8bYUx
 5gLrbO31gp/Lli17j9WbQel7KAyZMKft9SZfN5e9FablqXarltdW8Poou1EHTQZZYiicC+fL+j1
 sQ/zVwc/GzfpLex/erg==
X-Proofpoint-GUID: xrw2iHnzvj3D_h1s9OXxWEUc6uHjEVVV
X-Authority-Analysis: v=2.4 cv=BpOtB4X5 c=1 sm=1 tr=0 ts=6a6cd39a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=6WajdqW1cDUHmqu6UyEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: xrw2iHnzvj3D_h1s9OXxWEUc6uHjEVVV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310129

On 7/31/26 6:46 PM, David Heidelberg wrote:
> 
> On 31/07/2026 17:41, Konrad Dybcio wrote:
>> On 7/30/26 12:20 AM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>

[...]

>>> +        /*
>>> +         * TODO: This node represent bus supply to the cam i2c module.
>>> +         * Others DT do in similar fashion, but should be addressed
>>> +         * by the bus-supply in the future
>>> +         */
>>
>> I can't quite parse the second sentence..
> 
> I'll rephrase, I noticed that other device-trees where there is also i2c level-shifter also introduce always-on regulator. I let clanker check impact on power consumption, it's likely irrelevant, but in the future would be nice to have proper bus-supply property in use instead of always-on.

Aaah level shifters.. got it

Konrad
