Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF0433123F
	for <phone-devel@vger.kernel.org>; Thu,  7 May 2026 08:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141017; cv=none; b=Z/Gy3nzY4M6oBpGHVq8m8MRwdWQqeRlDLzgwnk9Zwu6DuLOzepRtBTaDaaR9I3dj8vclKKgeqYvd9T3sA7lrPQlWJ2Fe4f3zprgc2sup5xzMKDHtPP0W0cPfUUGrwN4K85+gQDIclw1Psjv4CGBMFvSifiCh6GR/ngy22+7oGRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141017; c=relaxed/simple;
	bh=CT3j++ZpGDXY8wdafFXCva+5jnuKJ5HyNp2OUnXXdnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B5sf0JXiBY3mOdRGJwm2hIU7EaTI8e20lPM8v/m6KJcDgP0Qo+pWa/wlr+XC7vA+ymEcpqxIEOlAOubkFWTkPgCt4nx9Qi/o/30IO124bJGwjmP3wm5jie8ZJzyhAIK/dVn/ZNX1RssBKBdUBW1dA0A0pnbahiUpJZ1SOZdSTVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gy69sdVD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IRfbqVNb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gy69sdVD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IRfbqVNb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6472Bw5F258806
	for <phone-devel@vger.kernel.org>; Thu, 7 May 2026 08:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mtfq3/2Ai6rBAqMoI9sGgKJF+BZSrWb/rzLufcVkZVE=; b=Gy69sdVD3lS7laZS
	/wp0O46q9aHxu6nX89nj8qDvQHz6HRUhwMUpIzX3vgS1tfWDRJogRPBlOw4022Dw
	SKN1oB0uCt9UYvZHAaOUV0jr/v26ppMRL0YGqtMtdxap30MVsXE3Itjd3kJiIIl9
	oUFrGPLOuqwjwgT0ofDP9tggROhfDsv7t1MDgiAuhujaTHSZyOt0gIt1ZpMO2L3v
	Zsb/3Bayptn/50bcBGrDnTTe24CidGIsJS9UwgZIpghU/0s8/Pt44+l3TbhouDec
	jXvUO2B7pQo7uDH6ImjgjaNTb6d9kOHN/eiTYb1HocISq9CcQn+z6FBjgD7aQiTR
	bRka+w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hr8s4dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 07 May 2026 08:03:34 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-631284608a7so991137.2
        for <phone-devel@vger.kernel.org>; Thu, 07 May 2026 01:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778141013; x=1778745813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mtfq3/2Ai6rBAqMoI9sGgKJF+BZSrWb/rzLufcVkZVE=;
        b=IRfbqVNbc5FSlh2dkNdmfZ7lBRQ7CAOXoGQOjwAZHAfMZu4fvVUvwZnxk6HAsaEl72
         xTzg1oNf5Bel5YJmvjUT4wsLLb7Oy0RLaDXFTpQzEudnmvT7l9NUvfyb8ULBxUZjYHN1
         qWPe6WG/ZhuO5cRqx90PqlGypw3zwUBNRs97BZAeONM/Q2ADR1AbOVFlmkhttD2XzXGK
         CFSYgt+eyq3ymYnDZeSGGlPLoIbpDYroZrsxoZ1ncl8cBp/hiPHKq+dJtKW+E36cAkGj
         y5WfUUpDwo4rWDMTwOnf5oGYUjLWcWlSnXkydSvQSCmn1lRltT7ROQcYNDgsLEWb5cEQ
         URdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778141013; x=1778745813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mtfq3/2Ai6rBAqMoI9sGgKJF+BZSrWb/rzLufcVkZVE=;
        b=ABChe/8Xg3FOaDi7e0QEydQDvLlYqh3uCcf/XKgbAucivPO/C9aXjAq/BaOOd7rvYY
         NFFOkxLVVHfBE4bnsRxw2Emz7TSq91dE1HSGzqbXLHbHfv0DLbjRkiQ1QnB9DSF98C2a
         Q7xfCDkl02O288bK6nBdGkR1smnwVKVQEDzNP21kiqBEJ55bz/ELhNcmF6u0/6MX4flW
         UERPmuuO/xD+zC65kKLpywpTbS9Pp/wMGtiRFiJL9Gz10Es3zkLPZwA5ctFgrJikX61y
         6WSqOa8AnwWngPMvj5uC+DERG6HhxBhRNKHUI+wvu4mUZ5EAhx82YRCRWli9sIV95phl
         dVdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UZJBadtD68piDLo2qVN8ebpxn5T8GVJ7YAeoJG4fu+tymTpzUWXnv0rEmdUu8gxLwlCyiicssMDKwTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTVtLYnWtORmUWyXj4Rt1D4aSdstcokclBLljKPZ42ygfVPonl
	XwrlkM6fZb5Jgd2q7t3mZjmUAztODcLuOZ98A+qc2VqP4t1CC4n5W4TcF8Bbdca+Bm8kElnTkD5
	XkJBSZ8KgzmXPjCxqKmhaRkeGva8o6qcjeWaUS3Dn0rQR4PezyMUnem4SLYM5ke4CPg==
X-Gm-Gg: AeBDiesLH1iSM0AkCc1D7PBRVnnxYp9Ahl+HLEW7kyADxUiIC7ZyJAu/5sAVZNhFxH+
	GOS/y2MrgDy7YPFEsW4eA7qN6LLdXgHLp3iLe4RR3DItm5YgFh3bWMSxnjJyqKwRZVRrGcMuhPZ
	DcdpCKhF9A1Z4L1LPeAjsQeYeLs4LBt+tCvTerK4m4GuvQmBqP2qDDYMKo0ikllyiBs/Zc1Zlfc
	hOClyk6NasLLPj2J5HkOgiB6HMhbJuHqpA7IwBOjz642B+oj82BjmFw2+Ul5W0TC1ZSmAOrinSi
	rP4VDLSkOMdOkKFW2ti8NNvUSWTizshQWESsYgERUqAe5BkoqUTLTZhFn3Fyee6E97Uq2PZh22T
	qxc2RF7OfxJ6/U31y9jIS0vPQX1436JFRMMe1MDJof75heCznTojnQTkkPdXp/+wvDRfW6tjgxe
	ICwNZRT3t0q7NdZBRRfkELw9u8
X-Received: by 2002:a05:6102:5ca:b0:604:f07b:efc0 with SMTP id ada2fe7eead31-630f8e78471mr843258137.2.1778141012934;
        Thu, 07 May 2026 01:03:32 -0700 (PDT)
X-Received: by 2002:a05:6102:5ca:b0:604:f07b:efc0 with SMTP id ada2fe7eead31-630f8e78471mr843244137.2.1778141012470;
        Thu, 07 May 2026 01:03:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc833e110fesm51608466b.46.2026.05.07.01.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:03:31 -0700 (PDT)
Message-ID: <fafc85f2-ede0-47db-9961-f34b2536a93a@oss.qualcomm.com>
Date: Thu, 7 May 2026 10:03:29 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] ASoC: qcom: qdsp6: q6afe: fix clk vote response
 type mismatch
To: Mark Brown <broonie@kernel.org>, Val Packett <val@packett.cool>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bhushan Shah <bhushan.shah@machinesoul.in>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Antoine Bernard <zalnir@proton.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260506204142.659778-1-val@packett.cool>
 <20260506204142.659778-2-val@packett.cool> <afvWsfgIz9Q-_cjH@sirena.co.uk>
 <35b45fd0-fffb-455b-b19d-5c29cc955563@packett.cool>
 <afv17gUZnHdXgyF_@sirena.co.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <afv17gUZnHdXgyF_@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: j9IwA1oSp6zAdIiwyGOT3_ZDBQRDtITg
X-Authority-Analysis: v=2.4 cv=caHiaHDM c=1 sm=1 tr=0 ts=69fc4756 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=sFoG9ZVZl0XijMoWAhsA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: j9IwA1oSp6zAdIiwyGOT3_ZDBQRDtITg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA3OCBTYWx0ZWRfX3I2gHhVokuyA
 LpvU0S1XntfCweBBdhSXi4Ik4z6rvaszlpo8jb2ZOkRGkGaVXfo/tUoHD0eHf6U0K7aNEaA+Dnk
 BMQQqGTQKOmx7pi5+HK+hrB9oXgGL22i9Z7F5HvbYFMHIt5acOBpnygmtI9BUZLXo97TYUarJaF
 uuPRw+md0gWdMRoJlYPVrNZrIqykndUUmBnlQ7EXzbeg/fV663wsmYIRIHWdX9msVQzvfPmTB4r
 vxB80AY9PVq4axAwSK8BpQS7PNbex2bocc3Hfl6p6lclJdklrkFknh37zIx4HM87g3B5+7RNjgg
 7UxZ8NXhHfQdsdyHIPBkTmgkAbtGdNUyTAfM6OwxjuiqPO4OFB7KJ9ikAyH0GcwYPE/zFYnln/i
 rz1TKPtI384wgGhiCNaH6tXLVSE1F3s/sJ+C1m4gxxrik8uh3Z20ZKsdqlzwda7Jbpj5Jf5fuYy
 s5zhJ2EXEPeuRZs4I4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070078

On 5/7/26 4:16 AM, Mark Brown wrote:
> On Wed, May 06, 2026 at 10:46:33PM -0300, Val Packett wrote:
>> On 5/6/26 9:02 PM, Mark Brown wrote:
> 
>>> Please send cover letters for your serieses, it helps tooling.  Please
>>> also supply inter version changelogs.
> 
>> ummm:
> 
>> https://lore.kernel.org/all/20260506204142.659778-1-val@packett.cool/
> 
>> I even Cc'd all(?) the lists, as usual.. Oh, sorry- not stable@ I guess.
> 
> Nor me, if the mail doesn't end up in my inbox then I'm going to have no
> idea that it exists.  You need to not only write a cover letter, but
> also send it to the relevant maintainers just like the patches.

(which the b4 tool will do for you)

https://b4.docs.kernel.org/

Konrad
