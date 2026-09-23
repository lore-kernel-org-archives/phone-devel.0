Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D06E408626
	for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 08:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153391; cv=none; b=fSbKXjO86qEVZ14tXrsJ0ZWL2Yqs3Gxkf/tFYA1+N7o7J0PbqYcT9vFtMQ5a73+JNPNgahEEnWVJqSstjbWntQ/Upn6kBi1iqTJ3zU4yQXK7EyE/3Kcy7YwHsgMc49x/izYr7rIYyeEfzbluZV2qzFLYrG/c7RXZjwhmFeJln7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153391; c=relaxed/simple;
	bh=cxzXBbMsdZF9TeyCb10H6lrW1get7uGvkOjPx4zLuTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQmJYvtaoexvVV212994NOp2WP76sxGYRb+ABXUkMcHUah3njHVvc3ZbvnHHBYK+VfCxK6dBl3FPnlyMUUkYlfTnm9qdnswPZQqtGbQXjCbD1lSWYHeLhlEe1NJrI7QH8CrH9wGLOc7d3bLW8OVbmVD/wzqYLNVTbZD1t29iHW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jH8Qmg9y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQS8ZPJI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jH8Qmg9y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQS8ZPJI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JOKn2003994
	for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 08:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	utlvqtMchWtCC+XcUEgzWRs3KfFgniwcYifuRa3zTB8=; b=jH8Qmg9ya8OiyBxg
	TzpLC3x0KbJQYjHG2zXS7IbFbTX3tBWK+i4/99z1j2Wo9Laz45fPMQEnL4azu5t0
	gxGpTh9qFHpbLXd1WfgXC3P/DR7VwBE/G/nqtx2d2nZhGyK5XwNyRaDHAXe0b/wY
	3Hi0AXrs9xIk9YOowArVEnpqSzbTCegrkDPfLPVCgTvrJ8Ng4sfLdAngFo5mPZgn
	OGSDBj0bHvni9AZWiTWIY7Lh1Qc2d3P3LSv34Gpt7SEdOT3Buj44WY8FlHpt8Z6/
	GBX4AT9SkTTwmD/ViN3CRYnUc6l6wKSPKZSC2yfdE56rbSGuAMu3cAZz1o540HIU
	BE3F8A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec4h1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 08:49:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9106a836457so1851406d6.1
        for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 01:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790153387; x=1790758187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utlvqtMchWtCC+XcUEgzWRs3KfFgniwcYifuRa3zTB8=;
        b=AQS8ZPJIj67yCYEx98JzIdQh7dBVWTcDg822/KZMeczRkxZespdS40dOkrh2kdA1vF
         6vPWKPGlBG9qgXw0Ums2MEY5yQOD/LxGyAcDHdcxpgUhPIDGgrORF+ps1yghnmsqq0oR
         X7NAHmWunXsxaD1OT5sFsDtwJwjPRqD4jM7JTabrHU1LrYbWUsJ9Aoj7LFScvi4J0KR5
         xHlDIKBBdHqW6MvMXOKMwIV11wFVCK4eh0syjJOGf3tV6JWpIGFn613QGqfK6g2vrSoy
         /eKVl2o1y5RT2MW8YK6h4IhjGyOA5iCTyxoyN3EDe7+bBNCZHllZ4XLapv1Ik7tVlz32
         5P0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153387; x=1790758187;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utlvqtMchWtCC+XcUEgzWRs3KfFgniwcYifuRa3zTB8=;
        b=c1tYR5wt+BdRfmDQY3KFuN3OXhtzcsrk+HonQ05ksBZ5GbYhKdU1mCLKFmIg7e3XJs
         yYyc9VVmLwAt7qF+id7sEfwQ5U/Eua/COK+n0uORxkmpJDTIcIMA2thmgMAp+iNNUCy7
         qxtJPwRJwmZNoAD5gGXdPfqgGByqFJ80JDAB0K13g40UISDZtN4coGOaB5trzHfmxHMh
         6+OhPQl6WpYRnQ+SXyh0RCSZeL3q1tkn9DQjr4r74nV8m59WHSoaAmGUrLEjzv/tJi/g
         7abAFk85sCyj3u6lCYXlnt8zgrSBt1/1cOwkJtOJtA0bx4YSM7VpKbI+yO8QqbrKKaVo
         zN7A==
X-Forwarded-Encrypted: i=1; AKwUvBzeVgZZ3DII78NhW4qUc2pPlxToXu7PC6LNsewz6Ets1NCFL7lSsX7pVeyxB71Znt82vXfiuIlAvFyR8Q==@vger.kernel.org
X-Gm-Message-State: AFuF++l+fjankeeoajkVMXN/MKBOACLytBWCcNKQEgM7menLtU9u4gBb
	W7wF22/jWB6UqVXt/MYKbazfsLDSubhm/0kMjnbSAkZL55p0zEuGos2vWkYrEeSLpQ3lJ8ORCSx
	MxUmVLWvMBx/A2/IBjKkLxBYxgMbbZmiAoI5wZmEpobI85Yo7rg/7UFFv5cciYD73faV4hx8y+g
	==
X-Gm-Gg: AYBFou3PTqOJhIicsTIDWs2/Cx1kOxtKJ6UpFrae6uijxwwSRZi0H+C9vaTrzsjEIRn
	/mPC4Q8n2EqxeJHJ18sSXdX3GaTT7BWcF0diuCW//WggRXOYs5XI3aiZZAcP40F1HGm5485uozD
	OxWi3KmkBCsuk8WrXuXQ2FQhxTUBxhrUtGSuFDEui+KrdXgDZnOPmXcxbiAJ06t9uIcNUgyapwM
	+iypxoTiM3Z9IWFgOADp+9W4hlRj6MJn4x9vSx7Z6FiMj3WAodNyoOBLrrKerLEW2RgpMOW4ajJ
	OQiut+0JoELxw3MHBR8JIP257uP1pb+MmXGnp093TVeRsn8w6uIfhePi1S4izEXW5v13R4Tnro2
	8JeyfRtoJ4zfAL9SSuVhOnFavhIX6QLQ/
X-Received: by 2002:a05:6214:1307:b0:90e:8d21:714 with SMTP id 6a1803df08f44-9140c3d4acdmr34040186d6.2.1790153386697;
        Wed, 23 Sep 2026 01:49:46 -0700 (PDT)
X-Received: by 2002:a05:6214:1307:b0:90e:8d21:714 with SMTP id 6a1803df08f44-9140c3d4acdmr34039986d6.2.1790153386272;
        Wed, 23 Sep 2026 01:49:46 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab37eaab7sm1171451a12.4.2026.09.23.01.49.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:49:45 -0700 (PDT)
Message-ID: <bac16296-42ee-4b18-b605-9ed178210f4e@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:49:43 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: Don't fail probe when the SDSP memory
 assign fails
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xingjing Deng <micro6947@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260923-fastrpc-fail-slow-v1-1-f3f6fabba6e3@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-fastrpc-fail-slow-v1-1-f3f6fabba6e3@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX45OCLz8y5pbQ
 2uLgHocm+JnC1NDN9FtfAIm4xiPkVJu7fzBkR5L2S5VL8CghQtNDzlsXv/dyL2fquJPhaWUDoK4
 vykK5+kdlHMO0hWOb9A07jWBe8ISHN15D0zltsQ3vxfa27vD6kIZA3ennzg3vLCgNrUVCb3f+vj
 8SYj47QUm/Vcvkbm67EFyRRAHTE5fwAuf34wmCEdT60a7jq2Bz71aug3X8FQhdy93ro6VVzalTw
 6LTbP38dqwJPM9fbKzpKsEsNSHdb6EJHP0Cep2+SAEz4x/Y37OerdBTBGwOVN8bgzw31o/5R8Ke
 pR3OTrUPE1TMX45oh6KKfGhc1Q8qqhUvcIvdA/bM9fF+gMoZqDj3ZF+YolLGIYHX1yokE1R9qcO
 +Qs5HJkgzK4STreVkUgVEmk0Zl7v30O2Qn1lgcP0QIhM2vJchFIhAhGnSaf5+qzW5RZZXyQHE8y
 eVuLk9LPmjn2IN1SU7Q==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab392ab cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=MpUze-A7R06OsIlp248A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: gltWX5KX21I4TeB4QPEs7nH0PkboLzHK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX9vbm+Pn3MrGg
 yzwSabPCvKsG8zlWlDisbCwYnxvbslOHwkEHfkDTfySNm8bXW4NrAtdzKrgLJqPXV9iC/Wf+YOK
 V7z4OajiluJ38esq00Ng+mqsj6oYjLk=
X-Proofpoint-ORIG-GUID: gltWX5KX21I4TeB4QPEs7nH0PkboLzHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230035

On 9/23/26 12:38 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> A failed qcom_scm_assign_mem() aborts fastrpc_rpmsg_probe(). On SDM845 this
> turns every SLPI subsystem restart into an endless probe failure loop:
> 
>  remoteproc3: crash detected in slpi: type fatal error
>  remoteproc3: remote processor slpi is now up
>  qcom_scm firmware:scm: Assign memory protection call failed -22
>  qcom,fastrpc 5c00000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: probe with driver qcom,fastrpc failed with error -22
>  qcom,fastrpc 5c00000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: rpmsg_dev_probe: failed: -22
> 
> The first assign succeeds and hands the reserved region to the VMIDs
> described in qcom,vmids. qcom_scm_assign_mem() reports the resulting
> owner set back through @srcvm, but the driver discards it, and nothing
> reverses the assignment in fastrpc_rpmsg_remove().

Making it do so there sounds like a better fix!

Konrad
