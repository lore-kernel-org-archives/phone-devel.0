Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E423E49EC
	for <phone-devel@vger.kernel.org>; Mon, 24 Aug 2026 06:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553174; cv=none; b=Bhh54E69FQ8Ru8pNBE6VqHziTIlHpAx36HS21uOxMJdO3QGAaFbNYmoAcqROvp+AXxIYuQ25DUJDmkFVsJxY7aSadgIG6BK4MY3MSfvlPtSpRafzdsaD4ITXBCnNyW+eEvyNWl/s8C9yDBtQAbCrHKXlAUXKpN13gcChViRzlwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553174; c=relaxed/simple;
	bh=syWg8sLJMiMY3ZnaxoaIqM1ZIb7QIUvi5ZvMkQfPIrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=POjaKZJ86WaGul9TNZIAf7Bbp6A97u6fLailBepjsZn4zeM13yF+rY5Y/vJ5gny0KbhRZOkU6nulPoK1xNvi28v5OeSfNmRV1WdRp+ItOHGakrIxHYsFHzEyz+cnTat3u89RD4nxpRd5xI+5k16RnZBL636F/HVb1Q44i+8lOFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQkGXMis; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7z+lFfd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQkGXMis";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7z+lFfd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RGXE1008293
	for <phone-devel@vger.kernel.org>; Mon, 24 Aug 2026 06:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zsWuTk19AfEdQatolBnlwSa9JrBBEN3NWLkZB28HQ34=; b=cQkGXMisLAMbwHrA
	Pr/3HK3FygWdY7riRf/M1xY9oDlCJmpiZtCmr7JvyTiJbPJJqotlW/wq3C2XaIxx
	996HTlan3FvrWU3oJtCaq8p/KmwvhqfrXGcHK8qm5Gv/fLxhnOBaEyD07y6LqMAc
	pu+JI4zG/b2ZgtCAEquz1Kk1qCCATdHqBXeowcNqb7oOX89jYzlyScYF+E5cPqs/
	dx6wK4Fp5piDCAAlnI9PO1jksfGQeLkVry52bZSWtMVOYJyHPQVlaytiR19E5pYr
	McGtI42e220nul5taZs5eCb7JTmdlAFpkl5FZBRpk6+wPmgeT+/WmT4yu9ZR1FnG
	ojyK4A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74xhdg8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 24 Aug 2026 06:32:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c9e97b626so5346791cf.1
        for <phone-devel@vger.kernel.org>; Sun, 23 Aug 2026 23:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787553171; x=1788157971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zsWuTk19AfEdQatolBnlwSa9JrBBEN3NWLkZB28HQ34=;
        b=E7z+lFfdU6P64mvjwXMVg5bs8+57tIEnitqEI5pqrCXSMbCutHiT+dFrgqaV9SqKfX
         9VsH6XFwXtjUtjVVocdf4UUA9IVN3bQP5SkkzWewXpgdcQlLv8QMFnH7ZRGDBpFIWMV0
         Se+LIXqXqOu0zf3pDZBGHTje+hr5wUVNbotQCuppc2TXv2dk8nNOOHUnfadiMbnuV3tF
         8zcq/Ib8MP9eh4V3a144B2ZSuepfxKmMALVufuZ5bKfL4rPBnpMfu9qRaEwtJa4rEsXd
         mP8ukyMW4JKgpzRLnobmsLAdSaVjHRBuwFvg9Bu/2YcO41hEkiM4G8SxfxRu0BC384fn
         bFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787553171; x=1788157971;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zsWuTk19AfEdQatolBnlwSa9JrBBEN3NWLkZB28HQ34=;
        b=p8tyo9YQv7IMAJ/JpPTwmPvAMPyCajczRT20zXa8P81K5iYMVRDWVcVqVs7E6vwQkb
         Cm2skBk9RLCpXvchilkYU4q1wR4KOg/qdyIZk74g0SUclwqhcKk+E025G6nM+k/q9jy9
         NdguxxM94KgEsLLc5Ylv/X61pl6490CN+sa3tF2Fb+81vqHmyWrqHcCp96fKRr2sHV0D
         AmpnQ6ur+G7I/NQHz1lEEdHibjoRqKMHK5FbzRl0ZhRQyzyPcaczMXrCjKg9XsdYFaNV
         6/7b7zJ1uyzpZpE4rkmBMEqCRvOM0w9Z4ZyAnSNpkfFTRljYlHRDmnLr9MeraHg8+iw7
         kttg==
X-Forwarded-Encrypted: i=1; AHgh+RovNCYB3VL5KscRGVCgHZZOXgvlOTsYdvm+tyzFezgUWeyDxhIBVFbaiBsqAirORbhbog8UcRaEJEoRTA==@vger.kernel.org
X-Gm-Message-State: AFuF++lkFv67iJsw0Ff48P+L4+I2YfdiMG4AhUB673JoTFn8TuFYG3U6
	KkCAZerWA90fPK3dTp7FV3w5ABWBdBNHYUXzfVK0wa9ggywJffbAsHLxgPbEZaGw07JSUQfqxZr
	F7+Td1CyBAD2WFkF9+oj6y4QE+Vp3AzhmPKLqKBCOqGyLzEs7AvVIbilG6mhzjXu8ww==
X-Gm-Gg: AR+sD125m/4s2uPoXPFJ9XC9qBFUcaRnmAjxc0s0JEOdXkKhBoAPY21eEuoMV1PO0gQ
	INExt5vCYFaluxmNg9zIru3k9rzbMFnyguCoF9XgysJKYENqJjCxiiphUH6ULY2W2QMo0tr3JpS
	6+aAISg6QOAwmR8gh2YwCw+R2CFPdhjblATgYL2lW+X91NoszkLXWdo3DSMGe0UAbEKZZ3C5Fbe
	PDrFDb3cck/i8CciliJI6E6p8RezRrCc0Wud4IdXnla30P5sXaTf4alzFFdFlJVG/iMID0DRvkt
	gfrT9BkJdbQJYL4VcqO8kuCnFkN32b007bFoV17zmpNXHa/3LK3vI9JzIg3tbfb4cy4NJN7s3iE
	1OVl0wo4vXJ/6V0GCQRpcMvz+
X-Received: by 2002:a05:622a:1ba3:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52df567630bmr175223921cf.1.1787553171066;
        Sun, 23 Aug 2026 23:32:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba3:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52df567630bmr175223721cf.1.1787553170623;
        Sun, 23 Aug 2026 23:32:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968a2183sm1060232966b.58.2026.08.23.23.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:32:49 -0700 (PDT)
Message-ID: <95de411b-0b6a-44e2-b343-fa557a917e9c@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:32:46 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sdm845-shift-axolotl: Add
 actuator for second rear camera
To: david@ixit.cz, Alexander Martinz <amartinz@shiftphones.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260822-dw9714v-v5-0-502bc7f43b8f@ixit.cz>
 <20260822-dw9714v-v5-3-502bc7f43b8f@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260822-dw9714v-v5-3-502bc7f43b8f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yzQMhTEszbVbJ1ndMDmC6Qar-qRXcR4c
X-Authority-Analysis: v=2.4 cv=GdQnWwXL c=1 sm=1 tr=0 ts=6a8be594 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=SGxFASbRf4WqgnW55AYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NiBTYWx0ZWRfX85NrVIQZkCTJ
 85Va1g6QF6VUfCHLnsTS2nHnPeAwt9m/ygPDG0RlgOlCJsyULYSu3wdfIQpQpB2Ho7Rm0q0HYJV
 X07FJpXY+muinLnTuN4vg6Fsu7xiciRRS7FJDp5tP5eqWY0dHKxY0SiPjBwUYrz4ziE6QqAJ0WO
 gCeqElvaUJjLjEw//nH0Ut+rH5GQcwT3hurg5A1+UDNKDaLRCx9+7wD0g/6kpSkS6SEa0z231SN
 1UWglNXwapnq1MoWM3i8cT8Ynzxx9nzaKpVqaN2FPRHEWfenI53eQ4bLH+Aaje7iDy79sqiVj0l
 78gdExh3qEFQD0FzLaWLe7JGTuGI+z3J0MmslGwJx95V/QJBAeXeubpuDwPwYvYlNcPnj1cBA/3
 NLr91Kn1v4iTrPXQiy+H3uXoy6SRs5ipeMTQqyNAvQTUWyPiA+GgRxvF3qwzogaNmBo4Ycs414U
 S4EJbYx8l3bKmEqdvJQ==
X-Proofpoint-GUID: yzQMhTEszbVbJ1ndMDmC6Qar-qRXcR4c
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NiBTYWx0ZWRfX4Wg2xtxzCt+E
 /cciKIHfmlve3XreSPzlPjvCiY2JL9uKLgCkNdynj8HzXrtvnl9qJXL1+btJi8YqSXhVG/1FBHt
 yPw94JOqcOR5UhkwtoAa73k48VTEJAs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240056

On 8/22/26 7:15 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The SHIFT 6MQ has a second rear (auxiliary) camera. Its autofocus
> actuator is a Dongwoon DW9714V.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
