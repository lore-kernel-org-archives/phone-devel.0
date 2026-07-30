Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D747D3D411B
	for <phone-devel@vger.kernel.org>; Thu, 30 Jul 2026 10:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408909; cv=none; b=tTTmeaMLmYkBMcRrjoGPnGUjiM8hX0raBexpQdqmYFtatAqISFa6nqNWV77pcJ4/tiaKoxRiWyDzR3jJVQQpJf8G7NethpWsm8/Q/n+vh6J2xsW1A8ptmidRSRVqnIiQm/pB3T70tyJ1QWINXJCsK1HDH0e5deKtc1TLuVHlzYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408909; c=relaxed/simple;
	bh=H1G1zrd3Sxftnuo0Q9N4COzqTspcIFH/Namcan/JP3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJ8hvo86lp+1bKoXXv0XC37TYWkLB80l5uPihiAGKJz88oqSkXbHM9WkIyQAIrz2ZUMyOxHNIz/ikM+BquXOsUQoOBrQFz2YG4GlPvSXgd5nYt/hYcd3MQWbpqUN92D20OrZ1ZOAVu4ID7irEPtsQbgvts0Eahu1EBYvWnqvQtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ylvj9Azw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j+ZXakfQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ylvj9Azw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j+ZXakfQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UA2SV9941516
	for <phone-devel@vger.kernel.org>; Thu, 30 Jul 2026 10:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N5XljM/bgrjEk1sGZPvuw6CNHRwZYnTArM17rAcHfhA=; b=Ylvj9Azwutve9/WQ
	K+ftXz4zcTeERQjp0290hzgPS7BY3McmAcB3hySzx3rUlAStgNe8M0Pli2YLoff6
	/rAuBUezL2n92XEd3Id4BEaC68onEvKBdwdEcX16/zYZt8Egoz/y3MCKfqPYcV7n
	DkNeAZilEIrOwpXWaPMEhd6L6sH9eefngMm3mC9QkTrGOJ4VKQsA8RdBOGq7zoQm
	RGhxS8jmTRQOc7nOiLiIuWg+ydOBaeBEuu87KEqvozqd9yMb12h9cUrjifV98HFR
	DA2Z4QzoWuytpAYdQ86pAvpbU6mI4ZqaUN+MwUV/1snyQgxYwgbNYy4bHa7fTBCH
	G6OtFQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3uqrduu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 30 Jul 2026 10:55:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90520763ceaso3773136d6.2
        for <phone-devel@vger.kernel.org>; Thu, 30 Jul 2026 03:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785408906; x=1786013706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5XljM/bgrjEk1sGZPvuw6CNHRwZYnTArM17rAcHfhA=;
        b=j+ZXakfQXhbLtgXb1zRl0l8DiyxkEGZ6RUUVKtnhewqsoipTfNbMysECCuMR2iCSFP
         PQl+EsYY8QVmaZdW+MLfXTUu0ppnofe+iwXj3XdIH36D03rSMJInbECJ4OgiHDkV0Wu9
         IIo8KgEL7F+fYjEPFsZzyhdyGNMQ/g4QbdW1U6tJo5JlENXbnbKc+/fItpzo3PCVbM8X
         1iWQtQsKsx/rG+Oi8N1l4nNovbjdjUa48Rjdc28hPa+hxl9P1/9BOHsth7PcpyNiLsd0
         jNFOtBxSDhXPEXKKa6SzoodRaZSH3wlTxm6mkIv8YYxqG/QLTBb2piQ7iJkVxCveT+Fc
         Uanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785408906; x=1786013706;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N5XljM/bgrjEk1sGZPvuw6CNHRwZYnTArM17rAcHfhA=;
        b=qmnsAScK35WYMm1GqKdZ3p/BvQdEOm97+ZwKF9vYFd+JGmTk+JIpgwriJXXJJD3IPX
         A0W+p82MIUnxv2X4sIvQp1ykNuNc9Vv9y+HpkSE4irdmngZJy8iX3hMiJQjDtvi9d5ow
         4NGtDppW+jdmpNpWWeqzlMWAQY7Zv8zBmllNQ5U1hn7amW8AHvBDzEI5KhOwnHlWZ5bP
         A2PDufz31XUDytIaYyekjhBxtbLFF71RKnsS/JZwb7ztt3wDVKYL5I80Yq6q45nmThR0
         AlvvPetbnPkOq7Q1B4YRnzF+w1xjBZ7dY+B5N45T7mbFSfssEV9RwYjZ8b75qCJS6IYM
         8HAA==
X-Forwarded-Encrypted: i=1; AHgh+RpONixKjC2NVy67inEG0jLH5lNocqDdtkmst2HnWnNZPf1lHTWbu9gZIj98tUPudxwoa5aN/Hc9CzQeag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjxCAgKxkvYOUdOE04F9Y5P4zElpWPA45VOuLGhtgNHYoB8WnN
	6QEaxZbPbhwof9kU3xT5slMkRw3r2WJj1xyvs/RJrtRxkq2CFQbbxqybzK5ROTX8NPGlojfojVy
	oTnSzN9sPvUjoyiv0/Zb5gJqEzL3o+b0Ojv8ZV1Usl2NEwDU/fiwQeKswfbt23mir8A==
X-Gm-Gg: AR+sD13xv90SY9QOpJaZh9m/xmpW9UlwNR6KnnomPP8sPML4XbMW5PIj5yg31HCp5ya
	2GmF5XjqJt9vu5q22Gkicp2N31CxPTEA00/l2GTwjQtyBrk2V0nsJs1I/myG9vk77foy9guZ958
	cR0ccuVwYAHVhHPEI3wv2tuBoDpfiUDDCcgrIvjfgZVl2wvUYcpfK2b55Hk0bxhip+ywwhlM96L
	5BhMqUytYQtJ4i3ZtKRqOt1IpECB1gruR3vNVBxkt/OKFmVcyrSUpTsmPeTuMhlrRXcpIL3WcWz
	gxVPemQB8OOd/OMcMFCrZyf4S7y5EXAmvGa7OFVIYjz67dy7EQ4nO6xsbgnXrlGgbuNVN3Wdnpk
	OZV9ltOMuDfrcXsuqRcMeLTKR
X-Received: by 2002:a05:6214:ca4:b0:907:87f1:3ff6 with SMTP id 6a1803df08f44-9083465ef60mr30182816d6.0.1785408906056;
        Thu, 30 Jul 2026 03:55:06 -0700 (PDT)
X-Received: by 2002:a05:6214:ca4:b0:907:87f1:3ff6 with SMTP id 6a1803df08f44-9083465ef60mr30181986d6.0.1785408905448;
        Thu, 30 Jul 2026 03:55:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07cb79672sm538207a12.13.2026.07.30.03.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 03:55:03 -0700 (PDT)
Message-ID: <8744db31-8d26-4fbf-84ec-2c8562abe327@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 12:55:00 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v9 7/9] media: qcom: camss: csiphy-3ph: Update Gen2
 v1.1 MIPI CSI-2 C-PHY init
To: David Heidelberg <david@ixit.cz>, Frank Li <Frank.li@oss.nxp.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
        Cory Keitz <ckeitz@amazon.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Frank Li
 <Frank.Li@nxp.com>, Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260729-qcom-cphy-v9-0-1f8d9fdab037@ixit.cz>
 <20260729-qcom-cphy-v9-7-1f8d9fdab037@ixit.cz>
 <ampyfquk7cH3oq1L@lizhi-Precision-Tower-5810>
 <f378a69d-64dc-45b9-bc16-b33d1041e421@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f378a69d-64dc-45b9-bc16-b33d1041e421@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4MSBTYWx0ZWRfX/4R2cYpDBrBx
 9vby1MAgtyeAAbm1IORuqAgEuXX6TaYle3xw3BzmDmPNthtmFdjTerxHRJrlEOVrRNLGVOL7mnb
 wIrSCdXlJuZUuWb33dqCeT+Fis5HQ5w=
X-Proofpoint-GUID: wT8t4ckGpY_eQwhnVM9-DpKw63JOlrj_
X-Authority-Analysis: v=2.4 cv=Do9mPm/+ c=1 sm=1 tr=0 ts=6a6b2d8b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=E6sBKzCaAAAA:20 a=gjA88sGhi7DxmjppWpoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: wT8t4ckGpY_eQwhnVM9-DpKw63JOlrj_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4MSBTYWx0ZWRfX1t5QqLp3HNEW
 oJ+ALmuXkRC3ggcOf4FFRy/+QQ+Lx96/zIdm0PXB21o5Wm6QhK73QnTAUB95YO6KWwMC2JOjVOo
 mzZXr1QSFwOEA59Dexisbzp6mQ2R8QdHOTMsihk8nVPxaDWKqOuWJTk1TANzmXBb2ivQ7zrLJZS
 c2lAuI9T5e7vvb9MmiKYTloYnzIh2t1dLcFEizBDhoxdR6e3917PKiJO1BKmkvLYd7hwoVe5Nq+
 Yh+gF+GEcf2Lw5TB1KBZ+okDlq0aLMOipyB4sX+fzWEPBi83Ev60Do0zxyf9qV2gr05ybOmf014
 whZE2yah0PTLdEXlW8zv0JkasuNh4kEz8RISXS4VVfA+9vIJrAjWbhqwKQOz2bxWtBcP4CVzXx2
 nbNT0TEPGd3ScbPbq/OorA0paFpsLnpIDMA/GDua841jHKs1MPoXNjZeCscDTM7bcOjKivBSXb/
 07AvSQvlRx5zIwL3yuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300081

On 7/30/26 12:09 AM, David Heidelberg wrote:
> On 29/07/2026 23:37, Frank Li wrote:
>> On Wed, Jul 29, 2026 at 10:20:02PM +0200, David Heidelberg wrote:
>>> These values should improve C-PHY behaviour. Should match most recent
>>> Qualcomm code.
>>
>> Any reference? where recent Qualcomm code? do you know the real reason?
> 
> That's a question for Konrad. This improvement was introduced in the upstreaming process, update taken from more recent sequence.

It matches the latest what we call "Hardware Settings Reference" set
of values, and happens to be present in e.g. this tree:

https://github.com/sony-sdm845/android_kernel_sony_sdm845/blob/lineage-20/drivers/media/platform/msm/camera_v3/cam_sensor_module/cam_csiphy/include/cam_csiphy_1_0_hwreg.h

also worth noting, 845 is csiphy v1.0, not 1.1

Konrad
