Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51746292B4B
	for <phone-devel@vger.kernel.org>; Sun, 12 Apr 2026 00:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775954223; cv=none; b=OAvNXgWr+cwzPCgmKErUcJXZWN2voDDAEXMBp8NOaUGs2VJiw5lQn4hnGqX38UR4mOV6ebTUsrWg3T8HahoeKAyghpZl4bcCXgAnA5mq6FPIdcDYmK2hkzRcrNQ57UzwDcyRDUFA8isHqSYveBMZo9xJGW81IJt5dgJj/vSVoD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775954223; c=relaxed/simple;
	bh=UpcRekWUAP0R8GR1KCO2fvFkn4AFuGUmPrQ9sVBInIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogCRBQeJFw20aOvGUa2w8cMR4djnEAFvD/Xwky0A7Z5Up/6AdQq68JPuLF+G1gvN/MxoWBQl5CycIy5IIWvGZdfuHgX9KIEpxOkC6527a5euV3e+5EloHMC9CpB7EC67z3KXb4f2bStwa4PHfpRSA9bj1E3eZ8wiFb+PaYNpqaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=duhDX+Ip; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Da/uuW/f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="duhDX+Ip";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Da/uuW/f"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BNqYXc1593565
	for <phone-devel@vger.kernel.org>; Sun, 12 Apr 2026 00:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ihFtdDylnPk9Mbhe+H+0TgYF
	L5uyP3A2wCC6fa1WMkA=; b=duhDX+IpgIbMKTphlJYC6ypDHEzpZDJ2VZEvoE+a
	zVuxyGRwVYaljQx+pW9q6/2kedEAecu2SsR4wBt7TMKDQBXK464Ug5cnR6aYlvph
	Zes+lzxsDj9KSSs4XRC56nWLceWezrQJH+IqlRAZUwPi7Ij1kFg6X+yU6bRPLXvc
	LzSeIe+BoznIIG/E8uZLHs9BUovtwV08VKN0XVAV9++5v+NL+dpoilUgb5Hzx1Rc
	VxS1hpekmh/hCbbnHzZL9ADKCYy5wFoXr8yKRPPf/vJNMT50IH7bSMz905NVIqf6
	f7GeHv3fYeCROAyX3JMb+YwP7U6k/BwcE7tl49MQAT9C/Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewksjxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 12 Apr 2026 00:37:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b6f869676so61331121cf.2
        for <phone-devel@vger.kernel.org>; Sat, 11 Apr 2026 17:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775954220; x=1776559020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ihFtdDylnPk9Mbhe+H+0TgYFL5uyP3A2wCC6fa1WMkA=;
        b=Da/uuW/fSea3kZT0xWImm/Ua3s9rg1aVyA69ZBU3PV8On+Qh1SNKGrJ7y6m3UpCETY
         ih5LeNP3NWdFnfg/n+zmQUqdqgOAApwF5swx187zicx13ZxNjahWTTMh0Rt49VdqZulY
         KAKoC+BpZuYa5SuxAzmQMGS3CtGbI6HCqlOgl6m/xkIb95HxI553OOtDV6vBNc961yqG
         kb9W274bg2xVqG6vdQ/922ZQ3h8kDKqDxUtKhz9mgiXZ0IAmtgCD2PhKmmQWu0P18wN3
         PIOTy3zHiN7RR/zJIq6dkLuoGMOROyojofGpesYWNUPHBGW6/M72yYHkGbjIQvu63wAV
         D/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775954220; x=1776559020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihFtdDylnPk9Mbhe+H+0TgYFL5uyP3A2wCC6fa1WMkA=;
        b=NtTdmTKp85+2phzvOrSOf6LV3AOeSe7N+UC15p+hCoRgn782GmW+eMbPnfReHJjF9F
         TXn9voyFGWvVioI+fw83nTPRx8VwyW80LAiugKDlWctSI6ftCb1eToKO6Lexn1P25svX
         Kgb+zr5vz2Sveogs9iPChdmDegH0UoD0FpENQ8e92K73a2MY2zE/bLSlKO4FSj78ZnHu
         gFiJIymt0eRhIaMY6xXXstb7Wv8kVWkojPCT2J3WpPr/WhN8ODxTIovxu+GVyUknqiII
         q8UwXDqYzKSTXw9cz3eWwAtQPpgBR/omtQ91YgMM80jBfWRmW9UDtYQYhy3DuITAn6Gh
         C4uA==
X-Forwarded-Encrypted: i=1; AJvYcCXxcCwcOVgBQD/FOPkwClR0S0p20mIIfRZu0W5A4NT9jLMiBwk4A3r8MVqBgglv7ZPF/llkN/KiR43XhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz46gWrbHJhLxTChLQoa6+Unk62RGj0lUtg6+yRpuhNnhCa/Xpn
	Dx6gfSSDLzazCC7PAMfVqzBdtnydQzB3ecM6MRoHfD+DFtxibcqZa6NWHzTmYyEOIoEtXArC24u
	wLb1EZ2q3/nblj2DBIT4zKciCgmTY9DBTUC3VmyzbXJUxZzeph7txXR0I5SYKTEJU/w==
X-Gm-Gg: AeBDievGYvuIHJLow+9JFgwk/nRs9WmqlXBZY6jePTUa9oSH0vFGFjyQAmyAmuNKNob
	NjymLsrK+Hf5AgWcuEyIklILk+8V0j93DTRXF7F5CORF0TlN9N2E1eIns647a8LXmOeZNCVO8OZ
	B81zm3V/mNr6SiAqLjtKZwBM4Kzf7HTCR2vzGIUcLWfB+cbFClpzep2MDydAWDOS84IGZHL3ig5
	iXxVp9PiiCjmOPCsnH8iuqtvwLYjxcY+lIFdz5iqsJHnPALJ+sp8hTJFtNAszQjvSH2otc7QiHX
	ybZpxJM64V7RXDpE/vg9Ljm2m5KdvSY5+xbI4RC++GyLRajAji3C4DzF1rvIvIMSht6grZPq1kT
	uFMjLjz+wIby6wdHdRZO1QkSTL71CV7bGqwNx/6bvZr1KZCgC7ee+j3+/7GPm89MgcO8Bw0z+e5
	oFeX/Uk+H0DYw2erYhgI36bmJIgBdByKEwlns=
X-Received: by 2002:a05:622a:8f0f:b0:50b:51eb:c353 with SMTP id d75a77b69052e-50dd5b77801mr83876021cf.31.1775954220578;
        Sat, 11 Apr 2026 17:37:00 -0700 (PDT)
X-Received: by 2002:a05:622a:8f0f:b0:50b:51eb:c353 with SMTP id d75a77b69052e-50dd5b77801mr83875841cf.31.1775954220159;
        Sat, 11 Apr 2026 17:37:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef071cbsm1708566e87.80.2026.04.11.17.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 17:36:57 -0700 (PDT)
Date: Sun, 12 Apr 2026 03:36:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Petr Hodina <petr.hodina@protonmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma:
 Disable MDSS
Message-ID: <eyg2ivnoe7weschcvyuhlzqfnqdfnomxc7b56kuypawj6ui7ds@tkdhm2ckrpq6>
References: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
 <20260317-beryllium-fb-v2-5-36b69dfb760c@ixit.cz>
 <73fyiqoxxg2gg5244wkukepdfw6lnguq63si22qsx2ueyna4hu@l4vyykvn43oo>
 <c746d310-5925-4656-9487-3521cb87793a@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c746d310-5925-4656-9487-3521cb87793a@ixit.cz>
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69dae92d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sfOm8-O8AAAA:8 a=sNNxi8BDMpKHXfyi1OcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDAwMyBTYWx0ZWRfX+xG38yqg/p7d
 frfLvQd6VMoZ78foJOSMnZegHXXImpxmRbo1aez4I1XrRes1Ir+LpMy6Ho4wa5Z/ZkvNkHfMJcM
 ZsSOteWwdV3EY9hGQWF80xgsvHPLhST7NIzkj1utBs9tKtGWBoxNeGRuvTlIhK+jHFBlxOIdaWI
 PLmtPQDh6GuELUVT1eByQJ5u9NBRdtM4My1f7bZnVh8R0ehui5rsD0ZE3ZqmO6KphrQ0+tLW9rb
 aFSSXiUJMYPZbAd3WXDZErJ6e+/lRmFmqNLyAbRl4+bdN3CuVGdqcCFd95XZhg9grQZ98iFgFT+
 RDBTt50lhkY5V+h0MWciFtDnxfZkTDhHq39CflxsSQVFWODhMJTcHolyELBsRbvI8XvgjErRUgi
 dJh0iTTHPZYoaDhttzQTr0nU2KZzUTUR0cSdTqU7exJqoxhiIscIUcSlggOb5FEuHrLipm6R/p2
 7WdchWvwKUP5woHOM+Q==
X-Proofpoint-ORIG-GUID: 5diDJME_eKuESWXO_lrb4rTY5PWLrCVk
X-Proofpoint-GUID: 5diDJME_eKuESWXO_lrb4rTY5PWLrCVk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604120003

On Fri, Apr 10, 2026 at 03:51:12PM +0200, David Heidelberg wrote:
> On 18/03/2026 15:47, Dmitry Baryshkov wrote:
> > On Tue, Mar 17, 2026 at 11:12:35PM +0100, David Heidelberg via B4 Relay wrote:
> > > From: Petr Hodina <petr.hodina@protonmail.com>
> > > 
> > > Currently the panel driver for tianma is broken.
> > > Disable MDSS to prevent DRM taking over the framebuffer.
> > 
> > I'd still hope that somebody can get it to work. I'd start by using
> > prepare_prev_first. Sumit reported the panel as working in 2020 and I
> > have no doubts that it was the case. Another option migt be something
> > related to the dispcc (see my [1]).
> 
> Sadly, the prepare_prev_first didn't solve the issue. The framebuffer ->
> MDSS takover happens, but at greetd (login) loading screen goes black and
> never restores.
> 
> Will need more work.

Do you see a console _while_ it boots, after the handover? I'd check the
mode programming. Maybe, disabling panel reset would also (temporarily)
help.

> 
> David>
> > [1] https://lore.kernel.org/linux-arm-msm/20260217-sdm845-hdk-v1-1-866f1965fef7@oss.qualcomm.com/

-- 
With best wishes
Dmitry
