Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575065;
	b=AUB1/+4bZKCsN7hgKW3cIunId47R+A1NQUtK5t9dq29coXRgzrNm5XVm6qoofTOVDE0Q
	 MY9c6Bll4yGoCZ5QRxXtOLkkO7HFD5FlBYF/pX1sAd9Og1hFG25ivGUk7hoarSyFv1Sbg
	 +AfmmrsDGgLh0vEAohlbw3h5DecCx7YN7sYnycoZTO6aUQ0KtX3NZvZEeyYXGe+LC6qyA
	 R6cOpi5LBin+hr+AMYfriUdpeTEdnLO8FAiDM9G1IWnK+U8KflMyFnHRl3fZ0NDTfm2cD
	 PaJpP3TwjgBYqGbqaY29syi5BZolCvg7xsgGrGgocXHKwLfsQeIiZixUSyNZrYbpuKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575065;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Smr7Z/3piMyOza0AUKfxwXfspyKbzW8yZL1Hru6qUxo=;
	b=5f+POz/gVtM2v7wPX99qlO2jfb9VRowQ4wwJMQwS+VEbssp40hEj9r9WZSVt++2incz5
	 NpaUE9/k3hFuJwR9DsFPMx+BSDb/gVSQHUS/EeV/a5yadRsDxpgq3w5jYxGp/eHbz1/vo
	 DoS1BkNUU98nyfAotHJIIaR8J6TGAc3IabSk0R7Mn8Tr4+Ptl2/ZbK9VeVkqNletwtsKe
	 Zm9Ykn+dmFFMdVXLzHFX0NjmJUq6Sp3pDKjArra9YxclLZc/YqXSOQiBcLvV3Nzin5bY5
	 t/4vQbM/uUcWB7r+q6diG5NslbbQR7wK7cbbMf7oKfVLoM0uPenmZIoKBCi0ry6O/fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cyF1QSRL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cytphHjt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7F8606A321
	for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 09:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB7F8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cyF1QSRL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cytphHjt
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j0n7756348
	for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 09:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Smr7Z/3piMyOza0AUKfxwXfspyKbzW8yZL1Hru6qUxo=; b=cyF1QSRLF8ir22kL
	23SSE8mJBUhI8j8RI5KZQ31i/WFwX9cHa5K3VruoNYQOMbwZq//tqdhQf4Uyoefz
	yn7vPPgQL0jEvDPIznsOri1mhsClaq4cQMYkBrEuCZmBHkNpDNYk/iiz4wp9k3kI
	yLfJmZNiKiZFPD+1JjwrLvH1O+zRs5MtNhT4YjTS1ikDx4Wpmcb/GZY0zjzbdkG3
	N8KZ4UNIkSqug6pCn49RWjF9pQzaee8V0Rh8tDvI2zhIEW5BGC5NV7hALU6eFytb
	B8Coy1WRVZ9ja/9+Kqqw3JYYT24yGwr29D87kPjxKXZZ7e/1ubnsSmkGiIPx6N6n
	COizoQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4u819-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 09:31:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53630cded29so1627411cf.2
        for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 02:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575062; x=1793179862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Smr7Z/3piMyOza0AUKfxwXfspyKbzW8yZL1Hru6qUxo=;
        b=cytphHjtwYMY7TDyr7YPRCahv9QPlg2sU5eu2k22fDGYEY2VBNciD7L5d4+oiVtT6h
         6pGuWytNzBAh6WvTmzqeBt8AKV7ox4xKD2mF7tDJ2TW804F2WCnzLz/qMmYB9NYKfrKH
         muPJS2E9EY7lQpeLRcUN83JSXHbv5WmAJ0L5HwfG9FSynUJ9HrVDxCA1bRPflxKraJUC
         MbH6IXDfukRjG3aCywhfu2uGZ39sqnNFGV9lGJ73uxcQcCpRsRgNQHCj804ebzfNNcUP
         A7znUCG214dWbz+cS/6gbVNLhNNz1lFjJuCsG+e/0EF0UNrFb5UIOfET6+fSHUN+0qC3
         vayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575062; x=1793179862;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Smr7Z/3piMyOza0AUKfxwXfspyKbzW8yZL1Hru6qUxo=;
        b=gwrnoh8V0bc8uQeNPrbhbJUtBfAk/gbi2XXaOLsSkuKHCC7wdwZp0Pj16WMfGR5TPq
         No1X54hjAfkB4ALp5OmGO0jtqjfb98ixnt8Mv4nB088OvNOe5p1SseSr/rZ5jnUIeMav
         w0jqCy5iQXTCNYegHUvvPfRhqs7ob4x0HzUYMkRTEsd9PDpDKLNHh2tyk1fK9MXwGfZS
         3ZsYF0LmPqF25D+CgrDT/Fu13aNcUZ1hx1Ovg1fPN0Smt1rKDvsQvO6X4qfuqCJyCAeh
         2UFrRlR31nT9/gSPlfvfWO3icbvjeaaaxQ9SLStZopG56J7fDuMZQ5zcNba5hKRj5hYU
         9u1g==
X-Forwarded-Encrypted: i=1; AKwUvBwFv8ngmoznOA9fDThuP0/zhaBfvpVro9DaHVE5xofFlhpEv+MfgBKm+kpkoTgMj+cDGxDViToa9tFrHw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJWXaRiEw/HUoIDYyFGPYYoLATQo+eTiqERxRELLTWHjDQFv1zb
	Ft/KcadJkUTdaWAWh4zCpQtK8GX5fZRfdfKNAYX9FgdvuTqpCvCLuIXVzyM0Wq14+aJsCZW39kw
	M8HF7Waw091iOBIIabyx8ywdszvoaNCnqzfZcTgveIWYBB6eD4N9RELkuIi1jJSIzUaR+gaSmrv
	3xj5g=
X-Gm-Gg: AYBFou29ubOl3bnVgvg/dG/J9M6/ilKeesfNJNllqDL+rXw1HUIqvC3Jjnvi1n2+81S
	YvZV5niWZJFCJs+GusWVQkgJm1qrMCQ7/nmBp6R3wDjZvS2Y7kulCgMBUT85Tn7eEeq8t4AF/Ny
	OEtXsFkW/D8c+1xAYbcoxgU4g6XqE/WbBw2agOiF28aGNkFqGr58EtTxb7apTJbq6B/uMpq/Awd
	6RsvRxSBZjhiqvx/i6G8ClrOltPZbfGR/GKzfWUUtrRPn8tt7uiegtCO0QrSbdcoIHdYHyMuWeb
	tTFr7OC/dqJHkNle1RVOBQ+i3Xs1JSuzF1vYBCcJ1Em/M6yHhnSmC1rfzL7gC8pp3wxGM/zBQQ0
	ZvCjY9zNA6KMVuRJrYaNg2w==
X-Received: by 2002:a05:622a:1a94:b0:51c:2324:666 with SMTP id d75a77b69052e-5369b7b364cmr27185311cf.3.1792575062269;
        Wed, 21 Oct 2026 02:31:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1a94:b0:51c:2324:666 with SMTP id d75a77b69052e-5369b7b364cmr27184921cf.3.1792575061742;
        Wed, 21 Oct 2026 02:31:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fd700asm56543566b.52.2026.10.21.02.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:31:00 -0700 (PDT)
Message-ID: <4ad0d837-dbbb-4f93-8c1c-8d2b1e4f5ba8@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:30:58 +0200
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] power: supply: qcom_battmgr: implement battery charge
 control on kodiak phones
To: Federico Amedeo Izzo <federico@izzo.pro>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
Cc: luca.weiss@fairphone.com, val@packet.cool,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <DM7V9WDDVQ2I.3THP2TDPTP994@izzo.pro>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DM7V9WDDVQ2I.3THP2TDPTP994@izzo.pro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: k5qawnNjC7JB9AIKXEejOZM5KFNrWelv
X-Proofpoint-GUID: k5qawnNjC7JB9AIKXEejOZM5KFNrWelv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX7GMYzUjSX71u
 f5UgjMSyI6DGsKasJDfPIQjnbgjCzJymwtwk+eCVw+oLyBxqry1y24aHF6LHxIH8DyoFdxVBkye
 Bw38+u2SeZ5Q/d2xQsE/3kRDYbyt/J0=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad88657 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=IUnBqQRzFFqqQajOH8UA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX5AOkPbeyboZ+
 9efxihpOY9GaPAwATTMfD6CI0EpqlhsA0F1z1d5BAbRLnWdrZiH3Ov2VoX56gvQu5MuzRgIFjAb
 Jt6+H86qEkltHMRf07UCfKRBRu9jBhPEthdilisfjZNimiaF6cErUGnWNbx9FOzGpwPbjpGKgp1
 X8AqIwo+r2qNq1/SHIpO1630odK3sEC2Hsy5hrNAJRcZh8p3IAnXzk2zEjb1eucJLvASjlXhZbX
 B/zWGPxEksKxyeGLVYh9QhWeIN1JNe486bL3Du5ObBjg4kHtptCSvgsqSD084DaJb/UQy6+s1yz
 y+6P9UfM/EqSYDzw2uDr6Seg4GfAyctLDUAhelDomN7AFL/+/aLDp0taUOLIqENNuqXGtMxN9fN
 gsjFXvlEsViROqAxGtR3O7/jDi1Bc+p7UyiugXxxjQFQqn57oOzDc3U3acT3TWcrIHzv8UR/abB
 Y8yERnRc+xh5aMBN52g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210037

On 10/18/26 11:46 AM, Federico Amedeo Izzo wrote:
> Hello,
> 
> I want to implement battery charge control support on two kodiak phones:
> motorola-dubai and fairphone-fp5. I kindly ask your feedback on my 
> implementation proposal below.
> 
> This feature also known as "charging limit" or "battery health" lets the user
> limit the battery charging range to 0-80% tipically, in order to extend the
> lifetime of the battery. It can also be used with a lower range 0-50% to
> prevent battery degradation on devices always connected to a charger.
> 
> Newer SoCs like SM8550 and X1E80100 implement charge control in the battmgr
> firmware, but kodiak (SM8350 in qcom-battmgr.c) does not support that (I tried
> using the same property ID as newer SoCs with no luck.
> 
> Looking at downstream implementations, both dubai and fp5 implement the ability
> to stop and start the charge with custom extensions to the battmgr firmware,
> while the actual charge control logic is implemented in a kernel driver (dubai)
> or in a userspace java service (fp5).
> 
> My plan is to expose the start/stop firmware capability of the two phones using
> the charge_behaviour sysfs property, then implement the charge control logic
> (start/stop charge depending on current level vs thresholds) in the qcom-battmgr
> driver itself and expose the sysfs properties charge_control_start/end_threshold
> to let userspace change the thresholds. The scope of this "software"
> implementation would be limited to SM8350 in qcom-battmgr as later SoCs can
> already do this in firmware.

I suppose this is something that could be introduced at the framework
level (+sre) - using a "stop charging" command to implement a charging
level cap.

For battmgr, I see there's a BATTMGR_SET_CHARGE_RATE (0x6) command
with the following arguments:

struct {
	struct pmic_glink_hdr hdr;
	__le32 battery_id;
	__le32 charge_rate;
	__le32 charging_path;
}

charge_rate being the % of full charge current that is allowed.
Maybe that could work. Or maybe there's an existing mechanism that
I failed to notice.

Konrad
