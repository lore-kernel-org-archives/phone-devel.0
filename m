Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E6146EF79
	for <phone-devel@vger.kernel.org>; Fri, 16 Oct 2026 10:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146609; cv=none; b=Mk+GBUC9pNCz8bdg1qQ3qgPo4HTMI2+kKCQPZQH1z3YK1adOKT4c0uOd3onyS893Y0LG/VxOqcbBidOtAuz1bcwu+EDFgPxzpst0rnKrKWKgLOJN9H7z5CzvnWeJGfAoQ+PWHNm4AGVo/x/gkqXrfWc2FpuVLcZLRvWaT4FDF6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146609; c=relaxed/simple;
	bh=fJhK4HS6UR5SV0eI9RcAuHMKhQdO49cC23Ycx/JHgh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9vs8rXMFF6F2gpP8VQtebb0FDzGK1ZfyLH75Ka1qqZFDl5MeRPRq17pOwGCaIiCRCSlnwABDdg4+r7E7lCN5lqcYiS8GWwdK87zmTIVAtVOiVLJyGl4nmEvs7X/ETcwSpPko8jqVycEE4bIIHvSmeiAKMd0aQ5kiCaQsSlwYSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZC2yUw95; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ckUdZdP4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZC2yUw95";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ckUdZdP4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAASR13069367
	for <phone-devel@vger.kernel.org>; Fri, 16 Oct 2026 10:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U5BV+EzuXrnKNRjeXd18ev/pbA/DKrL0rLwFMiB9prM=; b=ZC2yUw953tWfErXE
	2mkPwFzXBE9bFWEY46sXl6egXujqbnOvaR7R9YNg6nSqrPDFPFCbWCeuF07KXDup
	wfsb2pjMPqj5JM0e3zGO8XgzvSuSM47w96j5vBnmUpxaHffKJpkAMaKwrCGmqZRH
	llP+j7xtVPCKMXIFPLN6FCRvkc9dnx41MzF+4BHhML6wkKTzdwbpMS901nOSXPn2
	3DvTO+Tc2qY5MJ4CtSrwdYImxog9gJOmjB0X/Ad3pEnDpRnm2hMgewiJ/95JwQq3
	VKJlNRzkILkQZjy00wSKcePvWuzm6ZRLr6Shj0yxT6BoWJ4In7Ku/4jkfWok6yrh
	9PD8og==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba261vm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 16 Oct 2026 10:30:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso116927085a.1
        for <phone-devel@vger.kernel.org>; Fri, 16 Oct 2026 03:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792146606; x=1792751406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5BV+EzuXrnKNRjeXd18ev/pbA/DKrL0rLwFMiB9prM=;
        b=ckUdZdP4XnLtGPWjnmdyhnZs7eozkeerU08WF46TprbEddMdiH+GiX6SsnMuk841OK
         cMl9Br7SduzXHzcYmL9fKVsICaz26u3SNvm6ENvxMATufDswlNLGpel6YJ3GLqMhxPqc
         tKbAN4YNEzKOewK4cJhnYhPZwqJ83NBZFZhXzgw5gsV8duu6YObSBeDLVfcg0iHf2YqG
         eEz8DGB45Hp5GOr8bwKWFstnnmi0gHroDPsDc3zk/DEkS4ZfxIvKDTVagIYx6GI6rsCD
         UMKOwEG143Htps9AGrCg304O5UQhJXCTXBWZiGE92My3J4dP+Rm6dhrMqyxLJU4icVBc
         aAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146606; x=1792751406;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5BV+EzuXrnKNRjeXd18ev/pbA/DKrL0rLwFMiB9prM=;
        b=MwXyH5KwdBW/T6vR/l6HBtxL5tziGbhYhSs15s++qWxxoxakFAQZ7sZhCUD0j+u/8M
         np73mYHBY3TY16y5ys/AxO1FnRiLfn5SMI4Kb50C0ew8SZOVLxJJS0VNAnDrllpT3MOg
         sVV8aKDJ+EZUpcCbvjKEke4t8nK6Bdz+CsQ4Ig05+XDIMVn0dla9Ex0scUtSna7aFOD8
         INLVKI7mk4e59Z7ZmrhqO2i/11QznG7uZHUjzSFqknauTHJeM733HYVbtrdL4g1EHDgt
         9eMNrXbS1mGKLFXgN55/E8RmDcZ82LgOsTdkl8Ww4WLof1YGoDPw26CanTD0OnCLzDgK
         fpOw==
X-Forwarded-Encrypted: i=1; AKwUvBx0Tb/xE+JZh5bhvpFqKTyw07/Fsmy6xTuKUNFtz6PYO8g3KWKYLu7wsQ1zhmfgp5TbndsXhomrIrCgVQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLZvTKrEgdRdcV2faIhkbpcOyjX/eA5pfPmmt/iayw59cmD2sX7
	YEW5ZRye9V8tjq9PdfDR9twk2D1YNieCwQ7ZBYhzFRCp2gjeUiq+mX0W8NSTlItVeLHaKr3Y/Ac
	9lnoO/T648mqdMq1yoLXdcGhE2ufJgNRFGnxnHm0AYUuwIjSPGJ0dppoH9CH04hYRahLU3q+AQg
	==
X-Gm-Gg: AYBFou07QJxY/SJExNrKpB8fUI+brF+aYWmsyqf23eB0i5xiB9UNy7U+3160IVIgWvz
	oW8Qh0BQhsOTBGfBg92o59d78Qz5Hf7ShTA/x8gs6ElpCLGmC/B7emlFYj2jTybPoYBtCYyip16
	LAyzZMt4iXNfHoe/CWqDnjzG8NqBltw/wsIAoyovYaISn/Wi0Cu11C9O0JvXaGRa3UhuBiAY4vS
	d3HjNPQUcwDvUrtC6ag2pDjgYuAPcp1s/zDjnr8YiAk3U4ksvFowQ8YVnOz53wBbk0dI5xRb8YW
	8hip1SpZMFzKC0S9PKdHn5zkmRjYIfOX6YGwE9VV84W5ZRjGZNue9C6l+cAFu3TcAdS10VSKfnf
	zuGSWLx/udlEAB7v1JgJfkA==
X-Received: by 2002:a05:622a:e0cf:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5359f4990d7mr284988771cf.1.1792146606347;
        Fri, 16 Oct 2026 03:30:06 -0700 (PDT)
X-Received: by 2002:a05:622a:e0cf:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5359f4990d7mr284987941cf.1.1792146605583;
        Fri, 16 Oct 2026 03:30:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40914c3fd7sm57694766b.43.2026.10.16.03.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:30:04 -0700 (PDT)
Message-ID: <168f56a8-d66f-4a28-a689-8f52d9dbc331@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:30:02 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] regulator: qcom-rpmh: Add missing regulators in
 PM6350
To: Luca Weiss <luca.weiss@fairphone.com>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
 <20260901-fp4-regulator-supply-v1-3-68288ab70aee@fairphone.com>
 <ef06178c-5c16-4cb4-8ef8-3a7e1ccbf260@oss.qualcomm.com>
 <DLIIC89MM6AK.L02JKTJKQSXZ@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DLIIC89MM6AK.L02JKTJKQSXZ@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad1fcaf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=N2Uf8L9AEDu0dafj2CsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfXzjz/DhJrCdWa
 BCBMmxP8ooXGA0K+Avz2Zg3v9a20WBin66upB7gBO6r3bw4z0EirlyUrDFK47HWQGKa7+6PH4s2
 ewYHBfbCqRU4xIwrE4XIbpgVxn/r0mnLPdmjQiQxGMg4GcUw6u0RirBd39yAHZ6186xwwYkhDKg
 BNpildhnkx2qL9PyGWecSQZTRKSt9jTOvsjHQl1Kl5Vl+LE4iixa7SwtjsDQ7nN3c74IS/cDLYK
 huaGmidEOPOEoQaahRBzKfKzNuS50c3HXUsCdP1fGs31e6AlICpwd04Y1oXinyG1KKS3Jfx9PxC
 p1JpIZXe7YfpuwEu2uEXWhkaBVg2J5XeOUjbLTarOgxbhflEn1ASl+MEDnlpHwp23LblJ4q3qhg
 VOeFnDVmKDa4HkYqqwjJOjNoqT5YB/NbH1mLesqseGd5ui5uyY/fqY9nThxOlPuaEoxt1M2Ilhi
 TX60zoMZh8ndYlD9tEA==
X-Proofpoint-ORIG-GUID: bQTmFGTh6kT892lkCTNeWvHtQyamXmS6
X-Proofpoint-GUID: bQTmFGTh6kT892lkCTNeWvHtQyamXmS6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfXwn6uKUmG9MgM
 heWiyZrxcRSsfWrGpjQJtwcY/Riyvsf/lyTz5W0H6w3GPhNZZdLYcnfikjEXnyoQPDCUIX0cIbe
 +xErvwSzurQr5VaoJ8WfVPGUc3rCj88=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160041

On 9/18/26 4:21 PM, Luca Weiss wrote:
> Hi Konrad,
> 
> On Wed Sep 2, 2026 at 10:51 AM CEST, Konrad Dybcio wrote:
>> On 9/1/26 10:58 AM, Luca Weiss wrote:
>>> Add the missing smps3-6 and ldo17 definitions. While smps3/5 and ldo17
>>> are not used from the rpmh regulator driver on SM6350, the regulators do
>>> exist, so add them with the types based on the datasheet.

[...]

>>>  static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
>>>  	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps510, "vdd-s1"),
>>>  	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_hfsmps510, "vdd-s2"),
>>> -	/* smps3 - smps5 not configured */
>>> +	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps510, "vdd-s3"),
>>> +	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_ftsmps510, "vdd-s4"),
>>> +	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_ftsmps510, "vdd-s5"),
>>> +	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_hfsmps510, "vdd-s6"),
>>>  	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo,      "vdd-l1"),
>>>  	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_pldo,      "vdd-l2-l5-l7"),
>>>  	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo,      "vdd-l3-l6-l8-l9-l10"),
>>> @@ -1608,7 +1611,7 @@ static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
>>>  	RPMH_VREG("ldo14",  LDO,  14, &pmic5_pldo,      "vdd-l12-l14"),
>>>  	RPMH_VREG("ldo15",  LDO,  15, &pmic5_nldo,      "vdd-l15-l19-l22"),
>>>  	RPMH_VREG("ldo16",  LDO,  16, &pmic5_nldo,      "vdd-l16"),
>>> -	/* ldo17 not configured */
>>> +	RPMH_VREG("ldo17",  LDO,  17, &pmic5_nldo,      "vdd-l17"),
>>
>> L17 (and other NLDOs on this PMIC) can do 0.312 - 1.304 V, whereas
>> the pmic5_nldo config allows a range of 0.32 - 1.296 V. But I suppose
>> that is something to fix separately anyway
> 
> Can you help with what numbers from the data sheet we're supposed to
> use?
> 
> In 80-PR887-1 Rev. G, Table 3-20 would suggest L17 is programmable from
> 0.312V to 1.328V while "output voltage range" is 0.32V-1.304V.
> 
> But Table 3-11 does indeed show 0.312V - 1.304V as "Programming range"
> for this specific LDO.
> 
> So the voltages from the Table 3-11 are the ones to use? The other ones
> can be ignored completely? But e.g. the step size is only listed in
> 3-20.
> 
> Sidenote, are the step sizes for the SMPS listed anywhere?

+Kamal should be able to give you definitive answers here

Konrad
